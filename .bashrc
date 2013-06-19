#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:~/bin
export EDITOR=vim

# Set US keyboard
~/bin/us

# export TERM=linux 
# xmodmap .xmodmap

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
