.PHONY: fetch push

fetch:
	cp ~/.bashrc* ~/.inputrc ~/.profile ~/.vimrc .
	cp -r ~/.config/i3* .config

push:
	cp .bashrc* .inputrc .vimrc .profile ~
	cp -r .config/i3* ~/.config

