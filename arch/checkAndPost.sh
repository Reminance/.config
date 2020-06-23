#!/usr/bin/bash
# 项目名
cd ../$1
# git initialize
git config --replace-all log.date iso
# 分支
git checkout $2
/usr/bin/expect << EOF
set timeout 1
spawn git pull
expect "Username*"
send "xucheng\n"
expect "Password*"
send "123456789\n"
#interact
expect eof
EOF

dailyReport() {
  final_commit=`git log -1 --author=$1 --since=1.weeks --no-merges`
  commit_date=`echo $final_commit|awk '{print $7" "$8}'`
  latest_revision=`echo $final_commit|awk '{print $2}'`
  comment=`echo $final_commit|awk '{print $10$11$12%13$14$15$16$17$18$19}'`
  echo $1  #昵称
  echo $2  #用户id
  echo $commit_date      #提交日期
  echo $latest_revision  #最新版本号
  echo $comment          #内容
  if [ ! -s "../autoreport/revision_$1" ];then
    echo initial revision for $1
    echo -e "`date "+%Y-%m-%d %H:%M:%S"`\n$1\n$2\n$commit_date\n$latest_revision\n$comment" > ../autoreport/revision_$1
  else
    local_revision=`sed -n '5p' ../autoreport/revision_$1`
    if [ "$local_revision" == "$latest_revision" ];then
      echo $1 has already reported latest commit
    else
      echo latest is $latest_revision
      sed -i "1i $comment\n" ../autoreport/revision_$1
      sed -i "1i $latest_revision" ../autoreport/revision_$1
      sed -i "1i $commit_date" ../autoreport/revision_$1
      sed -i "1i $2" ../autoreport/revision_$1
      sed -i "1i $1" ../autoreport/revision_$1
      sed -i "1i `date "+%Y-%m-%d %H:%M:%S"`" ../autoreport/revision_$1
      # curl 提交地址
      totay_commit=curl "http://172.16.1.27:8080/daily/api/v1/daily/getMyDaily?current=1&size=15&userId=23"|
    fi
  fi
}

cat ../autoreport/account | while read user
do
  dailyReport `echo $user | awk '{print $1}'` `echo $user | awk '{print $2}'`
done

