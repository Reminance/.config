#!/usr/bin/bash
if [ $# -ne 2 ]; then echo 'Usage: ./checkAndPost.sh ../mall_bn_java dev-supplier' && exit 0; fi
url="http://172.16.1.27:8080/daily/api/v1"
source ../autoreport/init.sh $url   # 初始化工程与字典
cd $1      # 项目名
if [ $? -ne 0 ]; then exit 0; fi
git config --replace-all log.date iso    # git initialize
if [ $? -ne 0 ]; then exit 0; fi
git checkout $2    # 分支
/usr/bin/expect << EOF
set timeout 1
spawn git pull
expect "Username*"
send "xucheng\n"
expect "Password*"
send "123456789\n"
expect eof
EOF
today=`date +'%Y-%m-%d'`

saveCommitAndPost() {
  git log --author=$1 --since=2.days --no-merges|grep -v "^$" | awk 'BEGIN{RS="\ncommit ";FS="\n";ORS="\n\n";}{gsub("commit ", "", $0);gsub("Author: ", "", $0);gsub("Date:   ", "", $0);gsub("    ", "", $0);if($3~/'$today'/){print $0}}' > ../autoreport/data/$1/$today/commit
  # 等待伟健脚本调用post 提交
}

dailyReport() {
  final_commit=`git log -1 --author=$1 --since=1.weeks --no-merges`
  commit_date=`echo $final_commit|awk '{print $7" "$8}'`
  latest_revision=`echo $final_commit|awk '{print $2}'`
  comment=`echo $final_commit|awk '{print $10$11$12%13$14$15$16$17$18$19}'`
  if [ ! -s "../autoreport/data/$1/$today/revision" ];then
    echo initial revision for $1 at $today
    mkdir -p ../autoreport/data/$1/$today
    echo -e "`date "+%Y-%m-%d %H:%M:%S"`\n$1\n$2\n$commit_date\n$latest_revision\n$comment" > ../autoreport/data/$1/$today/revision
    saveCommitAndPost $1
  else
    local_revision=`sed -n '5p' ../autoreport/data/$1/$today/revision`
    if [ "$local_revision" == "$latest_revision" ];then
      echo $1 has already reported latest commit
    else
      echo latest is $latest_revision
      sed -i "1i `date "+%Y-%m-%d %H:%M:%S"`\n$1\n$2\n$commit_date\n$latest_revision\n$comment\n" ../autoreport/data/$1/$today/revision
      saveCommitAndPost $1
    fi
  fi
}

cat ../autoreport/user_cfg | while read user
do
  if [[ $(echo $user | awk '{print $1}') =~ ^title:* ]];then
    echo first row of usr_cfg is title, so we step to next row
    continue
  fi
  dailyReport `echo $user | awk '{print $1}'` `echo $user | awk '{print $2}'` `echo $user | awk '{print $3}'` `echo $user | awk '{print $4}'` `echo $user | awk '{print $5}'` `echo $user | awk '{print $6}'`
done
