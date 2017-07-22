# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="\[\033[38;5;3m\]\u@\W \[\033[38;5;15m\]> "

# enable color support of ls 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# define aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

echo "      ___           ___           ___           ___           ___     "
echo "     /\  \         /\  \         /\  \         /\  \         /\__\    "
echo "    /::\  \       /::\  \       /::\  \       /::\  \       /:/  /    "
echo "   /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/  /     "
echo "  /:/  \:\  \   /::\~\:\  \   /:/  \:\  \   /::\~\:\  \   /:/  /      " 
echo " /:/__/ \:\__\ /:/\:\ \:\__\ /:/__/_\:\__\ /:/\:\ \:\__\ /:/__/       "
echo " \:\  \  \/__/ \:\~\:\ \/__/ \:\  /\ \/__/ \/__\:\/:/  / \:\  \       "
echo "  \:\  \        \:\ \:\__\    \:\ \:\__\        \::/  /   \:\  \      "
echo "   \:\  \        \:\ \/__/     \:\/:/  /        /:/  /     \:\  \     "
echo "    \:\__\        \:\__\        \::/  /        /:/  /       \:\__\    "
echo "     \/__/         \/__/         \/__/         \/__/         \/__/    "
echo "                                                                      "
