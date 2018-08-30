# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Golang
export GOPATH=/home/cegal/go

# Prompt
source ~/.bashrc-ps1

# Alias
alias ll='ls -l'
alias la='ls -A'
alias python='python3'
alias dnf='sudo dnf'
alias gl="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit $@"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) %C(yellow)%d%C(reset) - %C(green)(%ar)%C(reset) %C()%s%C(reset) %C(blue)- %an%C(reset)' --all"

