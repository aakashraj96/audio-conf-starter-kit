#!/bin/bash

# libnice
pip3 install meson
export PATH="/home/ubuntu/.local/bin:$PATH"
git clone https://gitlab.freedesktop.org/libnice/libnice
cd libnice
meson --prefix=/usr build && ninja -C build && sudo ninja -C build install
cd /home/ubuntu

# libsrtp
wget https://github.com/cisco/libsrtp/archive/v2.2.0.tar.gz
tar xfv v2.2.0.tar.gz
cd libsrtp-2.2.0
./configure --prefix=/usr --enable-openssl
make shared_library && sudo make install
cd /home/ubuntu

# usrsctp
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr && make && sudo make install
cd /home/ubuntu

# libwebsockets
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
# If you want to use the latest master version of libwebsockets, comment the next line
git checkout v2.4-stable
mkdir build
cd build
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
make && sudo make install
cd /home/ubuntu