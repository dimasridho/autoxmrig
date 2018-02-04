#!/bin/bash

# go to root
cd

# server update & requesting apps install
apt-get -y  install git build-essential cmake libuv1-dev libmicrohttpd-dev software-properties-common;

# adding gcc repository
add-apt-repository -y ppa:jonathonf/gcc-7.1;

# reupdate source
apt-get -y  update;

# atcivate hugepages
echo 10000 > /proc/sys/vm/nr_hugepages

# creating swap files
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

# installing gcc
apt-get -y  install gcc-7 g++-7;

# cloning xmrig package
git clone https://github.com/xmrig/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

# making program
make

#lauch xmrig
screen ./xmrig -o pool.sumokoin.hashvault.pro:3333 -u Sumoo5H59i819DcLT3DjZVToKneE2UE5xFSGCZkzwmdkdg1W8KPF4s8CmAiNzhmEKW9VLupxAvk56JZYp64wTKEgKufmGzsAeq9.3d45c8aa98bd6c3107dc4b6a95e344b78190556323a2ea251ccfc2c49b8d7c28 -p lab -t 1 -k --av=2 --donate-level=1
