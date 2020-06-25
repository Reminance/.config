#!/usr/bin/bash
basepath=$(cd `dirname $0`; pwd)
url="http://172.16.1.27:8080/daily/api/v1"
# 初始化工程与字典
source $basepath/init.sh $url
today=`date +'%Y-%m-%d'`

saveCommitAndPost() {
  # 查询当天提交 并保存到本地
  git log --author=$2 --since=2.days --no-merges | grep -v "^$" | awk 'BEGIN{RS="\ncommit ";FS="\n";ORS="\n\n";} \
    {gsub("commit ", "", $0); \
      gsub("Author: ", "", $0); \
      gsub("Date:   ", "", $0); \
      gsub("    ", "", $0); \
      if($3~/'$today'/){print $0}}' > $basepath/data/$2/$today/$1/commit
  if [ ! -s "$basepath/data/$2/$today/$1/commit" ];then
    echo -e "\033[31m==== empty commit for $2 at $today, project:$1 ====\033[0m"
  else
    echo -e "\033[36m==== commiting report... ====\033[0m"
    # 当天提交不为空 开始提交
    # 等待伟健脚本调用post 提交
  fi
  echo -e "\033[36m==== latest commit is: ====\033[0m\n\033[35m`cat $basepath/data/$2/$today/$1/revision | sed -n '2,6p'`\033[0m"
}

dailyReport() {
  path=$1
  project=${path##*/}
  final_commit=`git log -1 --author=$2 --since=1.weeks --no-merges`
  commit_date=`echo $final_commit|awk '{print $7" "$8}'`
  latest_revision=`echo $final_commit|awk '{print $2}'`
  comment=`echo $final_commit|awk '{print $10" "$11" "$12" "$13" "$14" "$15" "$16" "$17" "$18" "$19}'`
  if [ ! -s "$basepath/data/$2/$today/$project/revision" ];then
    # 初始化用户数据
    echo -e "\033[36m==== initial revision for $2 at $today project:$project ====\033[0m"
    mkdir -p $basepath/data/$2/$today/$project
    # 初始化本地revision
    echo -e "`date "+%Y-%m-%d %H:%M:%S"`\n$2\n$3\n$commit_date\n$latest_revision\n$comment" > $basepath/data/$2/$today/$project/revision
    saveCommitAndPost $project $2
  else
    local_revision=`sed -n '5p' $basepath/data/$2/$today/$project/revision`
    # 比较本地revision与远程最新revision
    if [ "$local_revision" == "$latest_revision" ];then
      echo -e "\033[32m==== $2 has already reported latest commit, project:$project ====\033[0m"
      echo -e "\033[36m==== latest commit is: ====\033[0m\n\033[35m`cat $basepath/data/$2/$today/$project/revision | sed -n '2,6p'`\033[0m"
    else
      echo -e "\033[36m==== latest is $latest_revision ====\033[0m"
      # 更新本地revision
      sed -i "1i `date "+%Y-%m-%d %H:%M:%S"`\n$2\n$3\n$commit_date\n$latest_revision\n$comment\n" $basepath/data/$2/$today/$project/revision
      saveCommitAndPost $project $2
    fi
  fi
}

# 遍历用户配置文件
cat $basepath/user.conf | while read user
do
  # 过滤标题行
  if [[ $(echo $user | awk '{print $1}') =~ ^title:* ]];then continue; fi
  # 切换用户的项目地址
  echo -e "\033[36m==== switching project to $(echo $user | awk '{print $1}'):$(echo $user | awk '{print $2}') for $(echo $user | awk '{print $3}') at $today ====\033[0m"
  cd $(echo $user | awk '{print $1}')      # 项目
  if [ $? -ne 0 ]; then exit 0; fi
  git config --replace-all log.date iso    # git log.date output format init
  if [ $? -ne 0 ]; then exit 0; fi
  # 检出项目指定的分支
  git checkout $(echo $user | awk '{print $2}')    # 分支

  # 模拟交互输入git仓库用户名/密码
  /usr/bin/expect << EOF
  set timeout 1
  spawn git pull
  expect "Already up-to-date"
  exit
  expect "Username*"
  send "$(echo $user | awk '{print $3}')\n"
  expect "Password*"
  send "$(echo $user | awk '{print $4}')\n"
  expect eof
EOF

  # 项目 代码提交名称 日报提交名称 日报用户id 项目id 行为id 状态id
  dailyReport `echo $user | awk '{print $1" "$5" "$6" "$7" "$8" "$9" "$10}'`
  # 回到basepath
  cd $basepath
done
