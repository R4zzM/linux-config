#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -la'
alias pp='ps -ef'
alias make='make -j8'

# Make feh handle tiling VM as good as it can
alias feh='feh --scale-down --auto-zoom'

# Key bindings
bind -x '"l":"ls -la"'
bind -x '"s":"git status"'
bind -x '"t":"git tree"'

# History control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s histappend

# Set the prompt
if [[ -f ~/.git-prompt.sh  ]]; then
  source ~/.git-prompt.sh
  PS1='[\u@\h \W]$(__git_ps1)\$ '
else
  PS1='[\u@\h \W]\$ '
fi

# Set the environment
export PATH=~/opt/pebble-dev/PebbleSDK-3.2/bin:~/bin:$PATH
export EDITOR=vim
export PAGER=less

# Manpage colors for less
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages. 
# TODO: Should be in something like .lessrc?
export LESS_TERMCAP_mb=$red
export LESS_TERMCAP_md=$orange
export LESS_TERMCAP_me=$default
export LESS_TERMCAP_se=$default
export LESS_TERMCAP_so=$purple
export LESS_TERMCAP_ue=$default
export LESS_TERMCAP_us=$green

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
