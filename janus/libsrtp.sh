#!/bin/sh
cd ~
git clone https://github.com/cisco/libsrtp.git
cd libsrtp
git checkout v2.3.0
./configure --prefix=/usr --enable-openssl
make shared_library
sudo make install