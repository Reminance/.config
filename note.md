# mirror-proxy for github

## 加速

```
Github国内加速克隆及下载
fastgit.org
https://doc.fastgit.org/

gitclone.com
https://gitclone.com/

gitee
https://gitee.com/mirrors

cnpmjs.org
https://github.com.cnpmjs.org/

克隆加速

#原地址
git clone https://github.com/kubernetes/kubernetes.git

#改为
git clone https://github.com.cnpmjs.org/kubernetes/kubernetes.git

#或者
git clone https://hub.fastgit.org/kubernetes/kubernetes.git

#或者
git clone https://gitclone.com/github.com/kubernetes/kubernetes.git

release下载加速

#原地址
wget https://github.com/goharbor/harbor/releases/download/v2.0.2/harbor-offline-installer-v2.0.2.tgz

#改为
wget https://hub.fastgit.org/goharbor/harbor/releases/download/v2.0.2/harbor-offline-installer-v2.0.2.tgz

免替换方法

git config --global url."https://hub.fastgit.org".insteadOf https://github.com

#测试
git clone https://github.com/kubernetes/kubernetes.git

查看git配置信息

git config --global --list

取消设置

git config --global --unset url.https://github.com/.insteadof

raw文件下载加速

#原地址：
wget https://raw.githubusercontent.com/kubernetes/kubernetes/master/README.md

#替换为
wget https://raw.staticdn.net/kubernetes/kubernetes/master/README.md

提供web界面的github资源加速网站：

GitHub 文件加速：https://gh.api.99988866.xyz/
Github仓库加速：https://github.zhlh6.cn/
Github仓库加速：http://toolwa.com/github/
```

# forked repo(github.com forked)

/home/xc/workspace/java
├── mybatis
├── netty
├── spring-framework
└── yudao-spring-framework

```
origin https://github.com/Reminance/mybatis.git (fetch)
origin https://github.com/Reminance/netty.git (fetch)
origin https://github.com/Reminance/spring-framework.git (fetch)
origin https://github.com/YunaiV/spring-framework.git (fetch)
```

/home/xc/workspace/clang/
└── nginx

```
origin	https://github.com/Reminance/nginx.git (fetch)
```

# update code from remote origin repo using upstream

```
git remote add upstream https://github.com/leisurelicht/wtfpython-cn
git fetch upstream
git merge upstream/master
git push origin master
```

# archfi

```
curl -L archfi.sf.net/archfi > archfi
or
curl -L matmoul.github.io/archfi > archfi
```

# archdi

```
curl -L archdi.sf.net/archdi > archdi
or if sourceforge is down :
curl -L matmoul.github.io/archdi > archdi
```

# fuzzy find

```
sudo pacman -S fzf

sudo pacman -S ripgrep

yay -S universal-ctags-git

sudo pacman -S the_silver_searcher

pacman -S fd
```
