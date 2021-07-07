sudo apt install apt-transport-https
sudo apt install -y curl wget jq unzip

curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list

sudo apt update
sudo apt install skypeforlinux


