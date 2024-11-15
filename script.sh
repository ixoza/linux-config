#!/bin/bash

while [[ $ip != *.*.*.* ]]; do
    echo "Please enter a valid IP address for eth0:"
    read ip
done

while [[ $mask -lt 1 || $mask -gt 32 ]]; do
    echo "Please enter a valid mask for eth0:"
    read mask
done

#add dns and gw setting
echo "Hostname?"
read name

apt update && apt upgrade -y
apt autoremove
apt clean
apt install git curl wget htop tldr vim lsb-release unzip ufw openssh-server -y

hostnamectl set-hostname $name
echo "127.0.0.1 $name" >> /etc/hosts

ip addr add $ip/$mask dev eth0

echo "The IP address has been set to:"
ip addr show eth0
echo "Hostname now is : "
hostname
echo "Hosts is : "
cat /etc/hosts

for i in {5..1}; do
    echo "Rebooting in: $i..."
    sleep 1
done

init 6
