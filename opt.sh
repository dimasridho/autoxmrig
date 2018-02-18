#!/bin/bash
apt-get update && apt-get upgrade -y && apt-get install -y git ca-certificates build-essential autoconf automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev
git clone https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
autoreconf -f -i -v && CFLAGS="-O3 -maes -mssse3 -mavx -mtune=intel -DUSE_ASM" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl && make -j8
screen
