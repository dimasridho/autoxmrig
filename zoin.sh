apt-get -y update
apt-get -y upgrade
apt-get -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
git clone https://github.com/zoin/cpuminer-zoin.git 
cd cpuminer-zoin
./build.sh
make
Sudo make install 
cd cpuminer-zoin 
screen 
