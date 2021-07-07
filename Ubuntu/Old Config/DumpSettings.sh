mkdir Config
cd Config

echo "Please enter file name"
read fname

dconf dump / > $fname
 


var1=$(dconf read /org/gnome/desktop/background/picture-uri)













