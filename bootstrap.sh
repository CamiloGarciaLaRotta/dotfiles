#!/bin/bash

### install features

## repos to be added
# neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key

# firefox
echo "deb http://packages.linuxmint.com debian import" | sudo tee -a /etc/apt/sources.list

## apps to install
APPS = "vim linux-headers-$(uname -r) dkms build-essential pkg-config python-pip xorg i3 
				feh xfce4-terminal firefox neofetch" 

sudo apt-get update && sudo apt-get install -y $APPS
pip-install tldr

### sync dotfiles
rsync ascii background.png ~/Pictures/
rsync -a .* ~

source ~/.bashrc
