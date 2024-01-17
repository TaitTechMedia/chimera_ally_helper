#!/usr/bin/bash

# Request sudo privileges at the beginning
sudo true

# Unlock filesystem
sudo frzr-unlock

# Install ROG specific ChimeraOS build
sudo frzr-deploy rog-ally-gaming/chimeraos:unstable

# Install Konsole as this build doesn't include a console application
sudo pacman -S konsole