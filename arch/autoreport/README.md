# 自动提交日报
## 如何使用
### 1.初始化项目和字典
```
./init.sh https://m.quanhoo.com/daily/api/vi
```
  (测试环境无法域名直连生产， 可使用http://172.16.1.27:8080/daily/api/v1作为转发)

### 2.配置user_cfg
```
title:项目路径 分支 git用户名称 git密码 代码提交名称 日报提交名字 日报用户id 项目id 行为id 状态id
../mall_bn_java dev-supplier xucheng 123456789 xucheng 许诚 23 20 4 1
/home/xc/mall/mall_bn_java dev-supplier xucheng 123456789 xucheng 许诚 23 20 4 1
```
  添加一行用户配置， 参数释义见第一行

### 3.启动提交脚本 或者配置crontab
```
./start.sh
```
