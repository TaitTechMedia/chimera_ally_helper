#!/bin/bash

# Download the kernel and necessary headers
cd ~/Downloads
wget http://neroreflex.duckdns.org/linux-neroreflex-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
wget http://neroreflex.duckdns.org/linux-neroreflex-api-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
wget http://neroreflex.duckdns.org/linux-neroreflex-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst

# Download and build newest Rogue Enemy
git clone https://github.com/NeroReflex/ROGueENEMY
mkdir build
cd build
cmake ..
cmake --build .

# Install decky loader
curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh

# Install SimpleDeckyTDP
curl -L https://github.com/aarron-lee/SimpleDeckyTDP/raw/main/install.sh | sh