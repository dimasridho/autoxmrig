apt-get --assume-yes update && apt-get --assume-yes upgrade && apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev && git clone https://github.com/zoin/cpuminer-zoin.git && cd cpuminer-zoin && ./build.sh && make && Sudo make install && screen
cd cpuminer-zoin
screen sudo ./cpuminer -a lyra2zoin -o stratum+tcp://zoi-pool3.chainsilo.com:3032 -u ignkuu.user -p x
