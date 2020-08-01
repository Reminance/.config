#!/usr/bin/bash
[ ! -s "etc-sync.conf" ] && echo "etc-sync.conf不存在" && exit 2

# OS判断 与 预安装jq;
if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    DISTRO='CentOS'
    PM='yum'
elif grep -Eqi "Arch" /etc/issue || grep -Eq "Arch" /etc/*-release; then
    DISTRO='Arch'
    PM='pacman'
elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
    DISTRO='RHEL'
    PM='yum'
elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
    DISTRO='Aliyun'
    PM='yum'
elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
    DISTRO='Fedora'
    PM='yum'
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    DISTRO='Debian'
    PM='apt'
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    DISTRO='Ubuntu'
    PM='apt'
elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
    DISTRO='Raspbian'
    PM='apt'
else
    DISTRO='unknow'
fi
echo current distro is : $DISTRO
[[ "$DISTRO" == "CentOS" ]] && (which jq || $PM install jq)

today=`date +'%Y%m%d'`
api=$(sed '/^api=/!d;s/.*=//' etc-sync.conf)
app_id=$(sed '/^app_id=/!d;s/.*=//' etc-sync.conf)
app_secret=$(sed '/^app_secret=/!d;s/.*=//' etc-sync.conf)
data_download_path=$(sed '/^data.download_path=/!d;s/.*=//' etc-sync.conf)
data_unpack_path=$(sed '/^data.unpack_path=/!d;s/.*=//' etc-sync.conf)
data_history_max=$(sed '/^data.history_max=/!d;s/.*=//' etc-sync.conf)
log_path=$(sed '/^log.path=/!d;s/.*=//' etc-sync.conf)
log_history_max=$(sed '/^log.history_max=/!d;s/.*=//' etc-sync.conf)
[ -d $log_path/$today ] || (echo "初始化日志路径$log_path/$today"; mkdir -p $log_path/$today)
echo "同步开始, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"

cleanDir() {
    oldDate=$(date -d "- $2 day $3" +%Y%m%d)
    cd $1 && ls -d */ | sed "s/\///g" | grep "[0-9]\{8\}$" | awk '$0 <= '$oldDate' {print "'$1'/"$0}' | xargs rm -rf
}

# 0. 删除过期数据与日志
[ -d $data_download_path/$today ] && echo "开始清理$data_history_max天前的过期下载数据" && cleanDir $data_download_path $data_history_max || echo "清理过期下载数据结束"
[ -d $data_unpack_path/$today ] && echo "开始清理$data_history_max天前的过期解压数据" && cleanDir $data_unpack_path $data_history_max || echo "清理过期解压数据结束"
[ -d $log_path/$today ] && echo "开始清理$log_history_max天前的过期日志数据" && cleanDir $log_path $log_history_max || echo "清理过期日志数据结束"

# 1. 获取access_token
access_token=$(curl $api/access_token?app_id=$app_id\&app_secret=$app_secret\&grant_type=client_credential -s -X GET | jq ".data.access_token" | sed 's/"//g' )
[ ! -n "$access_token" ] && echo  "获取access_token失败" && exit 2
echo "获取access_token成功, access_token:$access_token"
auth_header='Bearer '$(echo access_token | base64)

# 2. 获取黑名单下载url, 并下载到目录
download() {
    [ -d $data_download_path/$today ] || (echo "初始化下载路径$data_download_path/$today"; mkdir -p $data_download_path/$today)
    echo "正在清空下载路径" && rm -rf $data_download_path/$today/* && echo "开始下载$data_download_path/$today/$1, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
    wget -q -O $data_download_path/$today/$1 $2 && echo "下载$1成功, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
}

# 3. 解压到指定目录
unpack() {
    [ -d $data_unpack_path/$today ] || (echo "初始化解压路径$data_unpack_path/$today"; mkdir -p $data_unpack_path/$today; mkdir -p $data_unpack_path/$today/json)
    echo "正在清空解压路径" && rm -rf $data_unpack_path/$today/* && echo "开始解压$data_download_path/$today/$1到$data_unpack_path/$today/, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
    unzip $data_download_path/$today/$1 -d $data_unpack_path/$today/ > /dev/null 2>&1 && echo "解压$1成功, 开始解压子级压缩文件到$data_unpack_path/$today/json, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
    for file in `ls $data_unpack_path/$today/`; do
        if [[ $data_unpack_path/$today/$file == *.zip ]]; then 
            unzip $data_unpack_path/$today/$file -d $data_unpack_path/$today/json > /dev/null 2>&1 && echo "解压子级压缩文件$data_unpack_path/$today/$file成功, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
        fi
    done
    echo "所有文件已解压成功, json文件共计[`ls $data_unpack_path/$today/json -l |grep "^-"|wc -l`]个, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"
}

downloadAndUnpack() {
    [ -f "$data_download_path/$today/$1" ] && echo "$1已存在" && return
    download $1 $2
    unpack $1
}

list_time_stamp=$(date +%s)
list_result=$(curl $api/parking/black-list-all -H 'Authorization:'$auth_header -d '{"AccessToken":"'$access_token'","TimeStamp":"'$list_time_stamp'","Sign":"'$access_token'"}' -s -X POST | jq ".data")
[ ! -n "$list_result" ] && echo "获取黑名单下载列表失败" && exit 2
# 如果是广州的需要遍历data, 全国的不用
download_filename=$(echo $list_result | jq ".filename" | sed 's/"//g')
download_source=$(echo $list_result | jq ".source" | sed 's/"//g')
[ ! -n "$download_source" ] && echo  "获取黑名单下载url失败" && exit 2
downloadAndUnpack $download_filename $download_source
echo "同步结束, 当前时间: `date "+%Y-%m-%d %H:%M:%S"`"


