# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# SSH
ssh-add ~/.ssh/github >/dev/null 2>&1

# exports
# pretty man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export GOROOT="$(brew --prefix golang)/libexec"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export PATH=~/.npm-global/bin:$PATH

# Alias
#alias go='go1.10.8'
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

alias ctags='/usr/local/bin/ctags'

alias vim='/usr/local/Cellar/vim/8.1.2100/bin/vim'
alias vi='vim'

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

source ~/.git-prompt.sh

# Command that Bash executes just before displaying a prompt
export PROMPT_COMMAND=set_prompt

set_prompt() {
  # Capture exit code of last command
  local ex=$?

  export PS1='\[\033[00;33m\]\W \[\033[00;34m\]$(__git_ps1 "%s") \[\033[00m\]'
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWSTASHSTATE=true

  # If exit code of last command is non-zero, prepend this code to the prompt
  [[ "$ex" -ne 0 ]] && PS1="\[\033[01;31m\]$ex\[\033[01;32m\] $PS1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
cd ~/go/src/github.com/github



eval "$(rbenv init -)"

source ~/.github-api-token

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"

export PATH="/usr/local/sbin:$PATH"
