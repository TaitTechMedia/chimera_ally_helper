#!/usr/bin/bash

# Request sudo privileges at the beginning
sudo true

# Install ROG specific ChimeraOS build
sudo frzr-deploy rog-ally-gaming/chimeraos:unstable

# Reboot
reboot