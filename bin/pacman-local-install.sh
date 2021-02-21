#!/usr/bin/bash

# 对于Archlinux及类系统，对已经安装的软件进行备份是一个很好的习惯，能够在我们系统出问题或者重装一次性还原系统所需软件。
# 首先生成软件包列表：

pacman -Qqen > ~/.config/arch/packages-backup/packages-repository-`date '+%Y%m%d%H%M%S'`.txt
pacman -Qqem > ~/.config/arch/packages-backup/packages-AUR-`date '+%Y%m%d%H%M%S'`.txt

# 重新安装：
# pacman --needed -S - < ~/.config/arch/packages-backup/packages-repository.txt
# cat ~/.config/arch/packages-backup/packages-AUR.txt | xargs yaourt -S --needed --noconfirm

# 清理多余软件包
# yaourt -R `pacman -Qdqt`

