#!/bin/bash

APPS="vim git build-essential pkg-config" 

sudo apt-get update && upgrade
sudo apt-get install -y --force-yes $APPS

git config --global user.name "CamiloGarciaLaRotta"
git config --global user.email camilo.garcia.larotta@gmail.com

cp ./dots/.*[a-zA-Z]* ~

rm -rf ~/Public ~/Music ~/Videos ~/Templates ~/Documents

echo "PS1=\"\[\033[38;5;3m\]\W \[\033[38;5;15m\]> \"" >> ~/.profile

echo "set completion-ignore-case on" >> ~/.inputrc
echo "set bell-style none" >> ~/.inputrc

/bin/bash
