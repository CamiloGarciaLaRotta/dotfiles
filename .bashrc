# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# SSH
ssh-add ~/.ssh/github >/dev/null 2>&1

# exports
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64/
export JDK_HOME=/usr/java/jdk1.8.0_181-amd64/
export PATH=$JAVA_HOME/bin:$PATH
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export PATH=$PATH:$HOME/AndroidSDK:$HOME/Android/tools
export PATH=$PATH:$HOME/Android/platform-tools
export ANDROID_HOME=$HOME/Android
export PATH=~/.npm-global/bin:$PATH
# Prompt
source ~/.bashrc-ps1

# Alias
alias ll='ls -l'
alias la='ls -A'
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

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
