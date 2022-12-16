# Bash Automation


### Installing Essential Apps
This script automatically install some essential apps in ubuntu also it can remove them.


File: [essential_apps.sh](Ubuntu/New%20Install/essential_apps.sh)
```bash
if [ -z "$1" ]
then
	echo "Arg required. example: 'install' or 'remove'"
	exit
fi

install_apps() {
	echo "Installing Now"
	sudo apt-get update
	
	# VLC Media Player
	sudo apt-get install -y vlc
	
	# Chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install ./google-chrome-stable_current_amd64.deb
	
	# VsCode
	sudo apt install -y software-properties-common apt-transport-https wget
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt update
	sudo apt install -y code
	
	# Flameshot - Screenshot tool
	sudo apt-get install -y flameshot
	
	# Curl
	sudo apt-get install -y curl
	
	# ULauncher
	sudo add-apt-repository ppa:agornostal/ulauncher
	sudo apt update
	sudo apt install ulauncher
}

remove_apps() {
	echo "Removing Now"
	
	#VLC Media Player
	sudo apt-get purge -y vlc
	
	# Chrome
	sudo apt-get purge google-chrome-stable
	
	# VSCode
	sudo apt-get purge code
	
	# Flameshot 
	sudo apt-get purge flameshot
	
	# Curl
	sudo apt-get purge -y curl
	
	# ULauncher
	sudo add-apt-repository --remove ppa:agornostal/ulauncher
	sudo apt-get purge ulauncher
	
	# Clean
	sudo apt-get autoremove
	sudo apt-get autoreclean
	sudo apt-get clean
}

if [ $1 == "install" ]
then 
	install_apps
elif [ $1 == "remove" ]
then
	remove_apps
else
	echo "Arg Error.  Only 'install' and 'remove' arg allowed"
fi
```

### Configure Shell
This script configures the gnome shell

File: [config_gnome.sh](Ubuntu/New%20Install/config_gnome.sh)
```bash
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
```

### Dump Settings

File: [DumpSettings.sh](Ubuntu/Old%20Config/DumpSettings.sh)
```bash
mkdir Config
cd Config
echo "Please enter file name"
read fname
dconf dump / > $fname
```

### Load Settings
File: [LoadSettings.sh](Ubuntu/Old%20Config/LoadSettings.sh)
```bash
echo "Please enter file name"
read fname
dconf load / < Config/$fname
```

### Change shell priority
File: [ChangeGnomeShellPriority.sh](Ubuntu/Old%20Config/ChangeGnomeShellPriority.sh)
```bash
pval=$(pidof gnome-shell)
echo $pval
sudo renice -n -20 -p $pval
exit 0
```

### Mouse accilaration fix
```bash
// Best
mouse.sh    etc/profile.d/mouse.sh     // Run at logon
----------------------------------------------------------------
// Super Accurate   (but little uncomfortable) (little slow)
xinput set-prop "A4Tech USB Mouse" "libinput Accel Speed" "0.90000" xinput -set-prop "A4Tech USB Mouse" "Coordinate Transformation Matrix" 0.147000, 0.000000, 0.000000, 0.000000, 0.15600, 0.000000, 0.000000, 0.000000, 1.000000
xinput -set-prop "A4Tech USB Mouse" "Coordinate Transformation Matrix" 0.145000, 0.000000, 0.000000, 0.000000, 0.15300, 0.000000, 0.000000, 0.000000, 1.000000

// Best of the Best    ******* [[ FINAL ]] *******
xinput set-prop "A4Tech USB Mouse" "libinput Accel Speed" "0.90000" 
xinput -set-prop "A4Tech USB Mouse" "Coordinate Transformation Matrix" 0.146000, 0.000000, 0.000000, 0.000000, 0.15500, 0.000000, 0.000000, 0.000000, 1.000000
```
