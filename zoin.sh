apt-get -y update
apt-get -y upgrade
apt-get -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
git clone https://github.com/zoin/cpuminer-zoin.git
cd cpuminer-zoin
./build.sh
make
Sudo make install
echo 10000 > /proc/sys/vm/nr_hugepages
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p
cd cpuminer-zoin
screen
