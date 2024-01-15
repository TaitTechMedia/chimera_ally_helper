#!/bin/bash

# Request sudo privileges at the beginning
sudo true

# Unlock filesystem
sudo frzr-unlock

# Install necessary dependencies
sudo pacman -S install build-essential libncurses-dev bison flex libssl-dev libelf-dev

# Download the kernel and necessary headers
cd ~/Downloads
wget http://neroreflex.duckdns.org/linux-neroreflex-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
wget http://neroreflex.duckdns.org/linux-neroreflex-api-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
wget http://neroreflex.duckdns.org/linux-neroreflex-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
tar --zstd -xvf linux-neroreflex-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
tar --zstd -xvf linux-neroreflex-api-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
tar --zstd -xvf linux-neroreflex-headers-6.1.52.nrflx1-1-x86_64.pkg.tar.zst
sudo cp usr/lib/modules/6.1.52--valve14-chos2-xanmod1-neroreflex-1 /boot/6.1.52--valve14-chos2-xanmod1-neroreflex-1
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo mkinitcpio -p linux

# Download and build newest Rogue Enemy
git clone https://github.com/NeroReflex/ROGueENEMY
cd ROGueENEMY
mkdir build
cd build
cmake ..
cmake --build .
cd ~/Downloads
rm -rf ROGueENEMY

# Configure Rogue Enemy preferences
echo "enable_qam = true;
    ff_gain = 255;
    nintendo_layout = false;
    default_gamepad = 1;
    rumble_on_mode_switch = true;
    gamepad_rumble_control = true;
    gamepad_leds_control = true;
    m1m2_mode = 0;
    gyro_to_analog_mapping = 5;
    gyro_to_analog_activation_treshold = 1;
    touchbar = false;
    controller_bluetooth = true;
    dualsense_edge = true;
    swap_y_z = true;
    enable_thermal_profiles_switching = true;
    default_thermal_profile = 1;
    enable_leds_commands = true;" | sudo tee /etc/ROGueENEMY/config.cfg > /dev/null
    sudo systemctl restart rogue-enemy.service

# Install yay aur helper
sudo pacman -S --needed base-devel git
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/Downloads
rm -rf yay

# Install decky loader
curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh

# Install SimpleDeckyTDP
curl -L https://github.com/aarron-lee/SimpleDeckyTDP/raw/main/install.sh | sh

# Install ROG Control Center
yay -S rog-control-center

# Run system update
sudo pacman -Syu

# Reboot
input ("Installation Complete: Are you read to reboot your machine?")
sudo reboot