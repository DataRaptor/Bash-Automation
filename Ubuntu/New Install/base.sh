#!/bin/bash

# Check arg
if [ -z "$1" ]
then
	echo "Arg required. example: 'install' or 'remove'"
	exit
fi


install_apps() {
	echo "Installing Now"
	
	
	
}

remove_apps() {
	echo "Removing Now"
	
	
	
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


