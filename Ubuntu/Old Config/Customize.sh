#My Workspace Configuration
#Author: Shamim Ahamed
#Email: pavel123@outlook.in


#update system
echo ":Updating List"
sudo apt-get update
echo ":Update Completed"

#echo ":Upgrading System"
#sudo apt-get upgrade
#echo ":System Upgrade Completed"


#Install Latest Gnome Window Manager



#Install Customization Tools
echo ":Installing Customization Tools"
sudo apt-get install gnome-tweaks
sudo apt install chrome-gnome-shell






#Solve Slow Scrolling Problem
echo ":Solving Mouse Scrolling Problem"
sudo apt-get install imwheel
#run Script




#Install and Configure Guake Terminal
sudo apt-get install guake
#Set Guake As Startup Application




#Fix Broken Installs
echo ":Fixing Broken Installs"
sudo apt-get --fix-missing install
sudo apt-get --fix-broken install


#Clean
echo ":Cleaning up system"
sudo apt-get autoremove 
sudo apt-get autoclean
echo ":All Installation are Completed"






echo ":Configuring System"
#-------------------------------#

#Set Wallpaper


#Set Logon Screep Wallpaper


#Configure Date Time


#Set Power Configs


#Set Mouse Speed And Aceleration


#Setup ShortCuts



#Download and Install User Themes



#Configure Ubuntu Settings



#Set Startup Application



#Guake Configurations




#My Customization settings
#-------------------------------#

#Install Gnome Extentions


#Install Shell Theme


#Install Icon Theme & Cursor Theme
echo ":Installing Icon and Cursor Themes"
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-icon-theme
sudo apt-get install paper-cursor-theme


#Show Icons on Desktop


#Keyboard & Mouse Configs


#Configure Topbar


#Configure Windows


#Configure Workspace 





echo ":Task Completed"






















