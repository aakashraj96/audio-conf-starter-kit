#!/bin/bash

sudo apt-get update

# List of packages to install before building Janus
packagelist=(
    git
    libmicrohttpd-dev
    libjansson-dev
    libssl-dev
    libsrtp-dev
    libsofia-sip-ua-dev
    libglib2.0-dev
    libopus-dev
    libogg-dev
    libcurl4-openssl-dev
    liblua5.3-dev
    libconfig-dev
    pkg-config
    gengetopt
    libtool
    automake
    gtk-doc-tools
    cmake
    python3-pip
    nginx
    ninja-build
)
sudo apt-get install ${packagelist[@]}