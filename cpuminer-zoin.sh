#!/bin/bash
apt-get -y update 
apt-get -y upgrade 
apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
apt-get install git clone https://github.com/zoin/cpuminer-zoin.git
cd cpuminer-zoin
./build.sh
make
sudo make install
cd cpuminer-zoin
screen
