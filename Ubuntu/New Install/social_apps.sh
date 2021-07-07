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
	
	# Telegram
	sudo apt-get install -y telegram-desktop
	
	# Rambox
	sudo snap install rambox
	
}

remove_apps() {
	echo "Removing Now"
	
	# Telegram
	sudo apt-get purge telegram-desktop
	
	# Rambox
	sudo snap remove rambox
	
	
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




