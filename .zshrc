# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cegal/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#### EXPORTS
# pretty man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export PATH=~/.npm-global/bin:$PATH

#### ALIAS
alias rg='rg -p -i'
alias cat='bat'
alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
alias python='python3'
alias dnf='sudo dnf'
alias open='xdg-open'
alias gl="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit $@"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) %C(yellow)%d%C(reset) - %C(green)(%ar)%C(reset) %C()%s%C(reset) %C(blue)- %an%C(reset)' --all"
alias gs="git status"
alias ga="git add"
alias gm="git checkout master"
alias gco="git checkout"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gpl="git pull"
alias gps="git push"
alias tx="tmux"
alias ts="tmux ls"
alias ta="tmux a -t "
alias tn="tmux new -t "

alias ctags='/usr/local/bin/ctags'

alias v='vim'

# vim fzf
export FZF_DEFAULT_COMMAND='ag -u -g ""'
export EDITOR=vim

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# vim powerline
export PATH=$PATH:$HOME/Library/Python/2.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/cegal/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh


cd ~/go/src/github.com/github

# eval "$(rbenv init -)"
# source ~/.github-api-token

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    echo "%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%} "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %~ is the current working directory relative to the home directory
PROMPT='$(check_last_exit_code)'
PROMPT+='$FG[228]%1~ %{$reset_color%}'


PROMPT+='$(git_prompt_info)'
