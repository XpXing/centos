#!/bin/bash
#System Required: CentOS 7+ SUSE ENTERPRISE 15
#Vision 1.2 update on 7/30/2019

xuzhi(){
        echo "须知如下
1.本脚本目前适用于Azure下创建的Centos7或者是SUSE ENTERPRISE 15虚拟机的根目录扩展
  在扩展之前请先确定执行过关机后的扩展磁盘 suse在执行前一定先运行sudo parted -l输入Fix
2.如果是在其他的环境(比如虚拟机)使用该脚本，请确定分区情况，其他一律不适用
 1）本脚本只适用于标准分区
 2）请确定根目录挂载是该硬盘最后的一个分区
3.这是一个菜鸟写出来的第一个脚本，有错误请立即联系作者 作者邮箱942308242@qq.com
  当然有疑问也可以提出
4.数据宝贵，请一定做好备份，若操作不当出事，作者概不负责!!!"
        menu
}

centex(){
        sudo df -hT
        echo "d
        
        n
        p
        
        
        
        w
        q
        "|sudo fdisk /dev/sda ; sudo partprobe ; sudo xfs_growfs / ; sudo df -hT
}

suseex(){
        sudo df -hT
        echo "d
        
        n
        
        
        
        
        w
        q
        "|sudo fdisk /dev/sda ; sudo xfs_growfs / ; sudo df -hT
}

clear
function menu()
{
cat << EOF
=======================================
|  Azure创建的Linux虚机/目录扩展脚本  |
|           Made by Xp_Xing           |
=======================================
1.阅读须知(第一次或不知道本脚本做什么的请先阅读)
2.centos7扩展
3.suse15扩展(请先确保之前运行了sudo parted -l的修复)
4.退出脚本
EOF

read -p "输入选项：" choice
case $choice in
        1)
        xuzhi
        ;;
        2)
        centex
        ;;
        3)
        suseex
        ;;
        4)
        exit
        ;;
        q)
        exit
        ;;
        *)
        clear
        echo -e "输入有误，请输入正确数字 [0-4]"
        sleep 1s
        menu
        ;;
esac
}
menu
