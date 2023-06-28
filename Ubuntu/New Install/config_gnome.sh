#!/bin/bash


# Gnome Tweak
sudo apt-get install -y gnome-tweaks
	
# dconf
sudo apt-get install -y dconf-editor

# Conky
sudo apt-get install -y conky-all


# Disable all Extensions
gsettings set org.gnome.shell disable-user-extensions true


# Fix Mouse        [[[[[[Not Working]]]]]]***************
sudo cp .mouse_fix.sh /etc/profile.d/mouse_fix.sh
sudo chmod +x /etc/profile.d/mouse_fix.sh
# set as startup

# Fix Scroll Speed
sudo apt-get install imwheel
sudo chmod +x ./.mousewheel.sh
./.mousewheel.sh



# Install New File 
touch ~/Templates/TextFile.txt
touch ~/Templates/ShellScript.sh
touch ~/Templates/PythonScript.py


# Install Extentions
echo "Preparing For Installation..."
sudo apt install -y curl wget jq unzip

echo "Installing Extentions. Please Wait..."
chmod +x ./.install-gnome-extensions.sh
cd $(dirname $0)
./.install-gnome-extensions.sh --enable --file my_extentions




# Configure -----------------------------------------------------------
# Disable window animation, Hide mount in dock, Minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock animate-show-apps true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Left Sidebar
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 44

# Transparent Window Moving
gsettings set org.gnome.shell.extensions.transparent-window-moving transition-time 1.5
gsettings set org.gnome.shell.extensions.transparent-window-moving window-opacity 235

# Blur my Shell
gsettings set org.gnome.shell.extensions.blur-my-shell brightness 0.63
gsettings set org.gnome.shell.extensions.blur-my-shell sigma 14

# Run .sh file on Click
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'

# Show Image Thumbnail for Cloud Storage
gsettings set org.gnome.nautilus.preferences show-image-thumbnails 'always'

# Single Click Action
gsettings set org.gnome.nautilus.preferences click-policy 'single'

# Mouse Accel Profile - [[Can be usefule in future]]
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'default'

# Clock Format  12h
gsettings set org.gnome.desktop.interface clock-format '12h'

# Show week name in top bar
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Enable hot Corners
gsettings set org.gnome.desktop.interface enable-hot-corners true

# Date Format: en_us 
gsettings set org.gnome.system.locale region 'en_US.UTF-8'

# Enable Extentions
gsettings set org.gnome.shell enabled-extensions ['blur-my-shell@aunetx', 'disable-window-animations@github.com', 'transparent-window-moving@noobsai.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'temperature@xtranophilist', 'axemenu@wheezy', 'openweather-extension@jenslody.de', 'netspeed@hedayaty.gmail.com', 'caffeine@patapon.info', 'show-desktop-button@amivaleo']

# Enable all Extensions
gsettings set org.gnome.shell disable-user-extensions false


# Hide mounted drive from sidebar
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false




echo "A reboot is required to Complete Installation"
echo "Press Enter to restart Now. Or close this window to restart later"
read choice
sudo reboot

