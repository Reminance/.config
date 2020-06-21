#!/usr/bin/bash
device=`ifconfig|grep enp|awk -F ":" 'NR==1{print $1}'`
sudo ethtool -s $device wol g
echo "DEVICE($device) ACTIVE WakeOnLAN DATE:" $(date +"%Y-%m-%d %H:%M:%S") >> /etc/rc.local.d/logs/eth-wol-active.log
