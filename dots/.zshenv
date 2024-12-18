# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
export PATH=$GOPATH/bin:$PATH

export PATH=~/.npm-global/bin:$PATH

#### ALIAS
alias rg='rg -p -i --hidden'
alias cat='bat'
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias gl="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit $@"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) %C(yellow)%d%C(reset) - %C(green)(%ar)%C(reset) %C()%s%C(reset) %C(blue)- %an%C(reset)' --all"
alias gs="git status"
alias ga="git add"
alias gm="git checkout master"
alias gmm="git checkout main"
alias gco="git checkout"
alias gcp="git cherry-pick -S"
alias gc="git commit -S --verbose"
alias gd="git diff"
alias gds="git diff --staged"
alias gpl="git pull"
alias gsh="git show --stat --oneline HEAD"
alias gps="git push"
alias tx="tmux"
alias ts="tmux ls"
alias tk="tmux kill-server"
alias ta="tmux a -t "
alias tn="tmux new -t "
alias td="tmux detach"

alias dup="gmm && gpl && dev up"
alias dclean="dev style && dev typecheck"
alias dcd="dev cd"
alias cdcore="dev cd shopify"
alias cdshop="dev cd shop-server"
alias cdjs="dev cd shop-js"
alias cddocs="dev cd shop-docs"
alias sup="spin up shop-server:pay-identity --memory 1080 --wait -n"
alias sl="spin list"
alias dtype="bin/tapioca dsl && bin/tapioca gem"
alias dlog="journalctl --follow | rg \"CCC =>\""

dflagon() {
  bin/rails g verdict:configure_flag "$@" --percent 100
}

dflagoff() {
  bin/rails g verdict:configure_flag "$@" --percent 0
}

alias gtco="gt co"
alias gtc="gt create --all"
alias gtl="gt log short"
alias gtl2="gt log"
alias gtps="gt submit --stack --cli"
alias gtpl="gt sync"

alias ctags='/usr/local/bin/ctags'

alias v='vim'

# vim fzf
export EDITOR=vim
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-messages --glob '!.git/*'"
export FZF_TMUX=1

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
# export PATH="/opt/homebrew/bin/python3":$PATH

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    echo "%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%} "
  fi
}

# TODO: persist the theme (see robbyrussel.zsh-theme
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %~ is the current working directory relative to the home directory
# RPROMPT=''
# RPROMPT='$(check_last_exit_code)'
# PROMPT+='$FG[228]%1~ %{$reset_color%}'
# PROMPT+='$(git_prompt_info)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$TTY
export PATH=/usr/local/bin:$PATH
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init - zsh)"
