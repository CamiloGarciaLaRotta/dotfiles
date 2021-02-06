#!/bin/bash

vim_path="$HOME/.vim/pack/plugins/start"

function brewget {
  if brew ls --versions "$1"; then
    brew upgrade "$1"
  else
    brew install "$1"
  fi
}

function clone {
  repo=$(echo "$1" | cut -d'/' -f2)
  if [ ! -d "$vim_path/$repo" ]
  then
    echo "=> installing $1"
    git clone --depth 1 "https://github.com/$1" "$vim_path/$repo"
  else
    echo "=> updating $1"
    echo "$vim_path/$repo"
    (cd "$vim_path/$repo"; git pull)
  fi
}

if which -s brew; then
  echo "=> updating brew"
  brew update
else
  echo "=> installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# symbolic link for all dotfiles
echo "=> symbolic link for dotfiles"
find ./dots -maxdepth 1 -mindepth 1 -exec sh -c 'ln -s "$1" ~' sh {} \;

# vim
echo "=> configuring Vim"
mkdir -p "$vim_path"

brewget "fzf"
brewget "tmux"

clone "ap/vim-css-color"
clone "dense-analysis/ale"
clone "editorconfig/editorconfig-vim"
clone "fatih/vim-go"
vim -u NONE -c "helptags vim-go/doc" -c q
clone "junegunn/fzf.vim"
clone "mhartington/oceanic-next"
clone "tpope/vim-commentary"
vim -u NONE -c "helptags commentary/doc" -c q
clone "tpope/vim-endwise"
clone "AndrewRadev/tagalong.vim"
clone "tpope/vim-fugitive"
vim -u NONE -c "helptags vim-fugitive/doc" -c q
clone "tpope/vim-rails"
vim -u NONE -c "helptags vim-rails/doc" -c q
clone "tpope/vim-rhubarb"
vim -u NONE -c "helptags vim-rhubarb/doc" -c q
clone "vim-airline/vim-airline"
vim -u NONE -c "helptags vim-airline/doc" -c q

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  echo "=> installing zsh"
  brew install zsh
fi

# To install useful key bindings and fuzzy completion:
echo  "=> PLEASE RUN:"
echo "$(brew --prefix)/opt/fzf/install"
echo "echo \"machine api.github.com login <user> password <token>\" >> ~/.netrc"

zsh
