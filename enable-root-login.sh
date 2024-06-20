#!/bin/bash

# 更新软件包列表
apt update

# 安装所需软件包
apt install -y openssh-server

# 启用 ROOT 登录
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# 重启 SSH 服务
systemctl restart ssh

# 设置 ROOT 密码
passwd root

# 删除此脚本
rm -f enable-root-login.sh

echo "ROOT 登录已启用。请使用 ROOT 密码登录您的 VPS。"
