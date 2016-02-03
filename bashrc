#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -la'
alias pp='ps -ef'

# Make feh handle tiling VM as good as it can
alias feh='feh --scale-down --auto-zoom'

PS1='[\u@\h \W]\$ '

# Augment the path
export PATH=~/bin:$PATH
export PATH=~/opt/pebble-dev/PebbleSDK-3.2/bin:$PATH

export EDITOR=vim

# Turn off the horrible bell!
xset b off

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
