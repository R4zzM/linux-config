#! /bin/bash

REPO=$(realpath $(dirname $0))

########
# Bash #
########
ln -s ${REPO}/bash-dotfiles/bashrc ${HOME}/.bashrc
ln -s ${REPO}/bash-dotfiles/bash_binds ${HOME}/.bash_binds
ln -s ${REPO}/bash-dotfiles/git-prompt.sh ${HOME}/.git-prompt.sh

#######
# Git #
#######
ln -s ${REPO}/gitconfig ${HOME}/.gitconfig