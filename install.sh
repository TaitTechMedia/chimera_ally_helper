#!/usr/bin/bash

# Request sudo privileges at the beginning
sudo true

# Unlock new filesystem
sudo frzr-unlock

# Install plasma and needed dependecies
sudo pacman -S plasma-desktop kwin sddm

# Install deckyloader
curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh

# Install SimpleDeckyTDP
curl -L https://github.com/aarron-lee/SimpleDeckyTDP/raw/main/install.sh | sh