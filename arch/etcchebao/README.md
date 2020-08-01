### ETC 车宝黑名单数据下载

#### 一. etc-sync.conf 需要配置 ETC 车宝帐号信息,数据存放路径,以及保留时长

```
# 车宝api地址
api=https://api-test.etcchebao.com
# 车宝账户app_id
app_id=72f6eb1c7d929122
# 车宝账户app_secret
app_secret=d6967a374597fe7f6c9c50f7ed519f86
# 车宝黑名单压缩包数据 下载目录, 需配置绝对路径, 不支持[~]符号
data.download_path=/home/xc/etcchebao/data/download
# 车宝黑名单压缩包数据 解压目录, 需配置绝对路径, 不支持[~]符号
data.unpack_path=/home/xc/etcchebao/data/unpack
# 车宝黑名单数据 保存期限, 默认为30/天
data.history_max=30
# 车宝黑名单下载日志目录, 需配置绝对路径, 不支持[~]符号
log.path=/home/xc/etcchebao/logs
# 车宝黑名单下载日志 保存期限, 默认为30/天
log.history_max=30
```

#### 二. 进入脚本目录, 测试运行

```
./syncEtcData.sh
```

> 如果正常运行 在数据目录 会有对应下载和解压的数据, 检查无误即可配置 crontab 定时执行

#### 三. 配置 crontab 执行

##### 1. 添加 crontab 定时任务

> 配置定时任务, 这里提供添加与删除脚本

```
# 注意:
# 这里username修改成主机用户
# cron修改成期待执行的周期,如(每天凌晨4点执行): sudo ./addCrontab.sh etcchebao '0 4 * * *'
sudo ./addCrontab.sh username cron
```

##### 2. 删除 crontab 定时任务

```
# 注意:
# 这里username修改成主机用户
sudo ./delCrontab.sh username
```
