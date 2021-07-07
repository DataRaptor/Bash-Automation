#!/bin/bash

# Check arg
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
	
	# Install OnlyOffice
	
	# Remove Libre Office
	
	
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




