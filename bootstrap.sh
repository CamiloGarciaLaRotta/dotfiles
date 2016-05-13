#!/bin/bash

### install features

## repos to be added
echo adding repositories for neofetch and firefox

# neofetch
echo -e "\ndeb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key

# firefox
echo -e "\ndeb http://packages.linuxmint.com debian import" | sudo tee -a /etc/apt/sources.list

## apps to install
echo updating and installing packages

APPS="dkms build-essential pkg-config python-pip xorg i3 feh xfce4-terminal neofetch firefox" 

sudo apt-get update 
sudo apt-get install -y --force-yes $APPS
sudo pip install tldr

### sync dotfiles
echo moving dotfiles

rsync -a ~/dotfiles/ascii ~/dotfiles/background.png ~/Pictures/
cp -r ~/dotfiles/dots/.*[a-zA-Z]* ~

source ~/.bashrc

echo deleting unwanted default folders
rm -rf ~/Public ~/Music ~/Videos ~/Templates

rm "$0"
