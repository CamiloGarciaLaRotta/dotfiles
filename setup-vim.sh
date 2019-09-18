#!/bin/bash

cp -r .bashrc .bashrc-ps1 .editorconfig .profile .inputrc .vimrc .config ~

mkdir ~/.vim/bundle ~/.vim/pack/plugins/start

# install autocomplete
git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
python3 install.py --all

# install vim plugins
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/pack/plugins/start/editorconfig-vim
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp.vim
git clone https://github.com/SirVer/ultisnips ~/.vim/pack/plugins/start/ultisnips
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
