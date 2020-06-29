#!/usr/bin/bash
today=`date +'%Y-%m-%d'`
# basepath=$(cd `dirname $0`; pwd)
basepath=/home/xc/mall/autoreport
cd $basepath
url="http://172.16.1.27:8080/daily/api/v1"
echo -e "开始提交: `date "+%Y-%m-%d %H:%M:%S"`"
# 初始化工程与字典
source $basepath/init.sh $url

saveCommitAndPost() {
  # 查询当天提交 并保存到本地
  git log --author=$2 --since=2.days --no-merges | grep -v "^$" | awk 'BEGIN{RS="\ncommit ";FS="\n";ORS="\n\n";} \
    {gsub("commit ", "", $0); \
      gsub("Author: ", "", $0); \
      gsub("Date:   ", "", $0); \
      gsub("    ", "", $0); \
      if($3~/'$today'/){print $0}}' | sed '$d' > $basepath/data/$2/$today/$1/commit
  if [ ! -s "$basepath/data/$2/$today/$1/commit" ];then
    echo -e "\033[31m==== empty commit for $2 at $today, project:$1 ====\033[0m"
  else
    echo -e "\033[36m==== commiting report... ====\033[0m"
    # 当天提交不为空 开始提交
    # 等待伟健脚本调用post 提交
    today_commit=`cat $basepath/data/$2/$today/$project/commit | awk 'BEGIN{RS="\n\n";FS="\n";ORS="%3Cbr%2F%3E"}{gsub (" ","",$4);{print $4}}'`
    echo $today_commit
    source /$basepath/post.sh $url $4 $5 $3 $6 $7 8 $today_commit $3
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
    # $2-$7分别表示 2代码提交名称 3日报提交名字 4日报用户id 5项目id 6行为id 7状态id
    saveCommitAndPost $project $2 $3 $4 $5 $6 $7
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
      # $2-$7分别表示 2代码提交名称 3日报提交名字 4日报用户id 5项目id 6行为id 7状态id
      saveCommitAndPost $project $2 $3 $4 $5 $6 $7
    fi
  fi
}

# 遍历用户配置文件
cat $basepath/user.conf | while read user
do
  # 过滤注释行
  if [[ $(echo $user | awk '{print $1}') == "#" ]]; then continue; fi
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
  expect "Username*"
  send "$(echo $user | awk '{print $3}')\n"
  expect "Password*"
  send "$(echo $user | awk '{print $4}')\n"
  expect eof
EOF

  # 项目 代码提交名称 日报提交名称 日报用户id 项目id 行rid 状态id
# title:1项目路径 2分支 3git用户名称 4git密码 5代码提交名称 6日报提交名字 7日报用户id 8项目id 9行为id 10状态id
  dailyReport `echo $user | awk '{print $1" "$5" "$6" "$7" "$8" "$9" "$10}'`
  # 回到basepath
  cd $basepath
done
echo
echo
