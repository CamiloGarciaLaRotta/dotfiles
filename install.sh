#!/bin/bash

ln -s ~/.dotfiles/.editorconfig ~/
ln -s ~/.dotfiles/.fzf.zsh ~/
ln -s ~/.dotfiles/.git-prompt.sh ~/
ln -s ~/.dotfiles/.gitconfig ~/
ln -s ~/.dotfiles/.gitignore ~/
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/.vimrc ~/
ln -s ~/.dotfiles/.zshenv ~/
ln -s ~/.dotfiles/.zshrc ~/

# vim
mkdir -p ~/.vim/pack/plugins/start

git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/pack/plugins/start/editorconfig-vim
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
git clone https://github.com/jiangmiao/auto-pairs ~/.vim/pack/plugins/start/auto-pairs
git clone https://github.com/junegunn/fzf.vim ~/.vim/pack/plugins/start/fzf.vim
git clone https://github.com/mhartington/oceanic-next ~/.vim/pack/plugins/start/oceanic-next
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
git clone https://github.com/tpope/vim-commentary ~/.vim/pack/plugins/start/vim-commentary
git clone https://github.com/tpope/vim-endwise ~/.vim/pack/plugins/start/vim-endwise
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive
git clone https://github.com/tpope/vim-rails ~/.vim/pack/plugins/start/vim-rails
git clone https://github.com/tpope/vim-ruby ~/.vim/pack/plugins/start/vim-ruby
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline

vim -u NONE -c "helptags commentary/doc" -c q
vim -u NONE -c "helptags vim-airline/doc" -c q
vim -u NONE -c "helptags vim-fugitive/doc" -c q
vim -u NONE -c "helptags vim-go/doc" -c q
vim -u NONE -c "helptags vim-rails/doc" -c q
vim -u NONE -c "helptags vim-ruby/doc" -c q

# zsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    sudo apt install -y zsh
    zsh
fi;
