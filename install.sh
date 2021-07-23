#!/bin/bash

exec > >(tee -i "$HOME/dotfiles_install.log")
exec 2>&1
set -x

vim_path="$HOME/.vim/pack/plugins/start"

function brew_get {
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

function setup_brew {
  if which brew; then
    echo "=> updating brew"
    brew update
  else
    echo "=> installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

# cp over dotfiles
echo "=> symbolic link for dotfiles"
find ./dots -maxdepth 1 -mindepth 1 -exec sh -c 'cp "$1" ~' sh {} \;

if [ "$CODESPACES" = true ]; then
  sudo apt-get install -y \
    bat fzf ripgrep shellcheck tmux zsh zsh-autosuggestions
else
  setup_brew
  brew_get "bat"
  brew_get "exa"
  brew_get "fzf"
  brew_get "ripgrep"
  brew_get "shellcheck"
  brew_get "tmux"
  brew_get "zsh"
  brew-get "zsh-autosuggestions"

  # To install useful key bindings and fuzzy completion:
  "$(brew --prefix)/opt/fzf/install"
fi

# vim
echo "=> configuring Vim"
mkdir -p "$vim_path"

clone "ap/vim-css-color"
clone "dense-analysis/ale"
clone "editorconfig/editorconfig-vim"
clone "fatih/vim-go"
vim -u NONE -c "helptags $vim_path/vim-go/doc" -c q
clone "junegunn/fzf.vim"
clone "mhartington/oceanic-next"
clone "tpope/vim-commentary"
vim -u NONE -c "helptags $vim_path/vim-commentary/doc" -c q
clone "tpope/vim-endwise"
clone "AndrewRadev/tagalong.vim"
clone "tpope/vim-fugitive"
vim -u NONE -c "helptags $vim_path/vim-fugitive/doc" -c q
clone "tpope/vim-rails"
vim -u NONE -c "helptags $vim_path/vim-rails/doc" -c q
clone "tpope/vim-rhubarb"
vim -u NONE -c "helptags $vim_path/vim-rhubarb/doc" -c q
clone "vim-airline/vim-airline"
vim -u NONE -c "helptags $vim_path/vim-airline/doc" -c q

sudo chsh -s "$(which zsh)" "$(whoami)"
zsh
