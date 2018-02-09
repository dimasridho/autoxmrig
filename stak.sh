#!/bin/bash 
sudo apt-get -y --assume-yes update
sudo apt-get -y --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano
echo 10000 > /proc/sys/vm/nr_hugepages
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p
sysctl -w vm.nr_hugepages=128
vm.nr_hugepages=128
git clone https://github.com/dimasridho/xmr-stak.git
cd xmr-stak-cpu
cmake .
make install
cd bin/
chmod +x xmr-stak-cpu
screen ./xmr-stak
