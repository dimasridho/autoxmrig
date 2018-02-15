#!/bin/bash
apt-get -y update
apt-get -y upgrade
apt-get install -y git ca-certificates build-essential autoconf automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev
git clone https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
autoreconf -f -i -v && CFLAGS="-O3 -maes -mssse3 -mavx -mtune=intel -DUSE_ASM" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl && make -j8
echo 10000 > /proc/sys/vm/nr_hugepages
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p
cd cpuminer-opt
screen
