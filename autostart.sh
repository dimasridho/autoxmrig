#!/bin/bash

sudo apt-get update
echo Y | sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev
echo 10000 > /proc/sys/vm/nr_hugepages
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
screen && sudo ./xmrig -o stratum+tcp://pool.xtl.fairhash.org:3333 -u SEiStP7SMy1bvjkWc9dd1t2v1Et5q2DrmaqLqFTQQ9H7JKdZuATcPHUbUL3bRjxzxTDYitHsAPqF8EeCLw3bW8ARe8rYFPVaHCL2kpLPmtprs.5000 -p x -t 2 --variant 1 --donate-level 1 -v 2
