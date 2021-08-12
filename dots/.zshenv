# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="af-magic"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#### EXPORTS
# pretty man
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GOPATH=$HOME/go
# export GOROOT=/usr/local/bin/go
export PATH=$GOPATH/bin:$PATH
# export PATH=$GOROOT/bin:$PATH
# export GO111MODULE=auto

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export PATH=~/.npm-global/bin:$PATH

#### ALIAS
alias rg='rg -p -i --hidden'
# alias cat='bat'
# alias ls='exa'
# alias ll='exa -l'
# alias la='exa -la'
alias gl="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit $@"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) %C(yellow)%d%C(reset) - %C(green)(%ar)%C(reset) %C()%s%C(reset) %C(blue)- %an%C(reset)' --all"
alias gs="git status"
alias ga="git add"
alias gm="git checkout master"
alias gmm="git checkout main"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gc="git commit --verbose"
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
alias tt="bin/rails test "
alias TT="TEST_ALL_FEATURES=1 bin/rails test "
alias tc="bin/rails test_changes"

alias cs="ghcs"
alias csc="ghcs create"
alias csd="ghcs delete"
alias csl="ghcs list"
alias css="ghcs ssh"
alias csa="ghcs create --repo github/authzd --branch master"
alias csg="ghcs create --repo github/github --branch master"

alias ctags='/usr/local/bin/ctags'

alias v='vim'
alias b='script/bootstrap --local'
alias s='GH_SSL=1 ENABLE_EMAIL_PREVIEWS=1 script/server'
alias bs='b && s'
alias dbd='script/setup --dotcom'
alias dbe='script/setup --enterprise'

alias inflate='ruby -r zlib -e "STDOUT.write Zlib::Inflate.inflate(STDIN.read)"'

# vim fzf
export EDITOR=vim
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-messages --glob '!.git/*'"
export FZF_TMUX=1

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# eval "$(rbenv init -)"
# source ~/.github-api-token

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    echo "%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%} "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %~ is the current working directory relative to the home directory
RPROMPT=''
PROMPT='$(check_last_exit_code)'
PROMPT+='$FG[228]%1~ %{$reset_color%}'
PROMPT+='$(git_prompt_info)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# cd ~/git/github

export GPG_TTY=$TTY

export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

function delete_ghae() {
  group_name="$1"
  echo "Marking resource group $group_name for deletion."
  az tag update --resource-id "$group_name" --operation merge --tags "auto_cleanup_date_utc='01/01/21@00:00:00'" || true
}

function delete_all_ghae() {
  subscription=${1:-"GHAE Dev 4"}
  for i in $(az group list --subscription "$subscription" --query "[?tags.owner=='camilogarcialarotta'].id" -otsv); do
    echo $i
    delete_ghae $i
   done
}

function list_ghae() {
  subscription=${1:-"GHAE Dev 4"}
  az group list --subscription "$subscription" --query "[?tags.owner=='camilogarcialarotta'].name"
}
