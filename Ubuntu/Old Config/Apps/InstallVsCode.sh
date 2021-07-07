#Installing VsCode
sudo apt update

echo ":Installing Dependencies"
sudo apt install -y software-properties-common apt-transport-https wget


echo ":Getting Package"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

echo ":Adding Repository"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"


echo ":Updating System"
sudo apt update
echo ":Installing VsCode"
sudo apt install code





#Install Compilers
sudo apt-get update

#C++
sudo apt-get install g++




#Install Extensions
#-----------------#
#Install Theme
code --install-extension thenikso.github-plus-theme

#Install Icon Theme
code --install-extension pkief.material-icon-theme




#C++
code --install-extension ms-vscode.cpptools

#Code Runner
code --install-extension formulahendry.code-runner

#Js Code Tester
code --install-extension WallabyJs.quokka-vscode

#Brower Preview
code --install-extension auchenberg.vscode-browser-preview

#Live Server
code --install-extension ritwickdey.LiveServer





#Web Developemnt
#---------------------#

#PHP Intelliscense
code --install-extension felixfbecker.php-intellisense

#Wordpress Package
code --install-extension jpagano.wordpress-vscode-extensionpack





#Change Settings
#--------------#
cd Configs
cp VsCodeConfig.json /home/pavel/.config/Code/User/settings.json





