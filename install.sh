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

# Set up steam AutoStart
cat <<EOT > ~/.config/autostart/steam.desktop
[Desktop Entry]
Type=Application
Name=Steam
Exec=steam -silent -forcecontrollerappid 413080
X-GNOME-Autostart-enabled=true
EOT

# Make the .desktop file executable
chmod +x ~/.config/autostart/steam.desktop

# Create keyboard brightness fix
#!/bin/bash

# Define paths
FIXES_DIR="$HOME/fixes"
SCRIPT_PATH="$FIXES_DIR/adjust_kb_brightness.sh"
SERVICE_PATH="/etc/systemd/system/keyboard-brightness-resume.service"

# Create 'fixes' directory if it doesn't exist
mkdir -p "$FIXES_DIR"

# Create the adjust_kb_brightness.sh script
cat << EOF > "$SCRIPT_PATH"
#!/bin/bash

# Path to the keyboard brightness file
KB_BRIGHTNESS_FILE='/sys/class/leds/asus::kbd_backlight/brightness'

# Check if the brightness file exists
if [ ! -f "\$KB_BRIGHTNESS_FILE" ]; then
    echo "Brightness file does not exist"
    exit 1
fi

# Read the current brightness
current_brightness=\$(cat "\$KB_BRIGHTNESS_FILE")

# Decrease and then increase the brightness
echo \$((current_brightness - 1)) > "\$KB_BRIGHTNESS_FILE"
sleep 1
echo \$((current_brightness)) > "\$KB_BRIGHTNESS_FILE"
EOF

# Make the script executable
chmod +x "$SCRIPT_PATH"

# Create the systemd service file
sudo tee "$SERVICE_PATH" > /dev/null << EOF
[Unit]
Description=Adjust keyboard brightness on resume
After=suspend.target

[Service]
Type=simple
ExecStart=$SCRIPT_PATH

[Install]
WantedBy=suspend.target
EOF

# Enable the systemd service
sudo systemctl enable keyboard-brightness-resume.service

echo "Setup complete. The service will adjust keyboard brightness on system resume."