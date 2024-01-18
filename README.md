# Chimera Ally Helper
This is a simple script to simplify installation of the latest needed tools to get Chimera tuned up correctly on the ROG Ally. None of these are my patches or my work, so all credit goes to the community and the creators of these tools.

## Installation
Open a terminal and run these commands. It will ask you for your password. This is "gamer"

`bash <(curl -sSL https://raw.githubusercontent.com/TaitTechMedia/chimera_ally_helper/main/terminal.sh)`

*Open up software center and install Konsole now in order to run the following commands*

`bash <(curl -sSL https://raw.githubusercontent.com/TaitTechMedia/chimera_ally_helper/main/upgrade.sh)`

`bash <(curl -sSL https://raw.githubusercontent.com/TaitTechMedia/chimera_ally_helper/main/install.sh)`

# Note about TDP
DON'T USE BUILT IN TDP LIMITER - USE THE SIMPLEDECKYTDP MENU TO CONTROL TDP

I highly recommend activating the TDP limit and setting it to 11 watts outside of games as this will provide a very smooth experience with extremely low wattage. If you leave the wattage uncapped, the governor, even on powersave or balanced mode will tend to use maximum wattage. Implementing an 11 watt limit solves this problem nicely and doesn't affect games as you can always set a different wattage per game.

Additionally set the lower limit to 11 watts and upper limit to 30 watts. I would REALLY not recommend going above 30 watts as this has the
potential to cause permenant damage.

# Note about Rogue Enemy
This tool configures Rogue Enemy to utilize custom settings which:
1) Enable the back paddles
2) Disable touch bar emulation

This should work in most games, but can cause issues in certain games (we believe Sony ports). If you would like to revert to the default 
settings which emulate the touch bar and map the back paddles to touch bar presses (this should work with ALL games), simply run the below 
command. THIS IS ALL ONE SINGLE COMMAND; COPY AND PASTE THE ENTIRE THING:

```
echo "enable_qam = true;
ff_gain = 255;
nintendo_layout = false;
default_gamepad = 1;
rumble_on_mode_switch = true;
gamepad_rumble_control = true;
gamepad_leds_control = true;
m1m2_mode = 1;
gyro_to_analog_mapping = 5;
gyro_to_analog_activation_treshold = 1;
touchbar = true;
controller_bluetooth = true;
dualsense_edge = false;
swap_y_z = true;
enable_thermal_profiles_switching = true;
default_thermal_profile = -1;
enable_leds_commands = true;" | sudo tee /etc/ROGueENEMY/config.cfg > /dev/null && sudo systemctl restart rogue-enemy.service
```

## Reference
NeroReflex for rouge-enemy: https://github.com/NeroReflex/ROGueENEMY and his custom kernel