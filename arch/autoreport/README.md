# 自动提交日报
## 如何使用
### 1.初始化项目和字典
```
./init.sh https://m.quanhoo.com/daily/api/vi
```
  (测试环境无法域名直连生产， 可使用http://172.16.1.27:8080/daily/api/v1作为转发)

### 2.配置user_cfg
```
title:git用户昵称 日报提交名字 日报用户id 项目id 行为id 状态id
xucheng 许诚 23 20 4 1
```
  添加一行用户配置， 参数释义见第一行

### 3.启动提交脚本 或者配置crontab
```
./checkAndPost.sh ../mall_bn_java dev-supplier
```
  第一个参数为项目相对路径 第二个参数为分支
  (用于git checkout 其实分支配上去没啥用 master也能拉代码）
