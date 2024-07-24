# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

bind -m vi-insert "\C-l":clear-screen
export HISTCONTROL=ignoredups
set -o vi
export PS1="\h:\W \u$ "
