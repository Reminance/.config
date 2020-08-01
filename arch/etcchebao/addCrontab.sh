#!/usr/bin/bash

[ ! -s "etc-sync.conf" ] && echo "etc-sync.conf不存在" && exit 2
current_path=$(cd "$(dirname $0)";pwd)
crontab -u $1 -l | grep syncEtcData.sh && echo "任务已存在, 请先删除任务重新添加" && exit 0
echo "$2 mkdir -p \`sed '/^log.path=/!d;s/.*=//' $current_path/etc-sync.conf\`/\`date +\"\%Y\%m\%d\"\`;$current_path/syncEtcData.sh >> \`sed '/^log.path=/!d;s/.*=//' $current_path/etc-sync.conf\`/\`date +\"\%Y\%m\%d\"\`/\`date +\"\%Y\%m\%d\"\`.log 2>&1" >> /var/spool/cron/$1


