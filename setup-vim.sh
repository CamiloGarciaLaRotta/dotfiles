#!/bin/bash

cp -r .bashrc .bashrc-ps1 .editorconfig .profile .inputrc .vimrc .tmux.conf .config ~

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
git clone https://github.com/tpope/vim-commentary ~/.vim/pack/plugins/start/vim-commentary
git clone https://github.com/mhartington/oceanic-next ~/.vim/pack/plugins/start/oceanic-next
git clone https://github.com/tpope/vim-bundler ~/.vim/pack/plugins/start/vim-bundler
git clone https://github.com/tpope/vim-endwise ~/.vim/pack/plugins/start/vim-endwise
git clone https://github.com/tpope/vim-rails ~/.vim/pack/plugins/start/vim-rails
git clone https://github.com/tpope/vim-ruby ~/.vim/pack/plugins/start/vim-ruby

vim -u NONE -c "helptags vim-go/doc" -c q
vim -u NONE -c "helptags vim-rails/doc" -c q
vim -u NONE -c "helptags vim-ruby/doc" -c q
vim -u NONE -c "helptags vim-fugitive/doc" -c q
vim -u NONE -c "helptags vim-airline/doc" -c q
vim -u NONE -c "helptags vim-bundler/doc" -c q
vim -u NONE -c "helptags commentary/doc" -c q
