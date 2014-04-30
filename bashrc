#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# A few exports
export PATH=$PATH:~/bin
export EDITOR=vim

# Turn off the horrible bell!
xset b off

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
