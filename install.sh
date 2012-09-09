#!/bin/bash

###############################################################################
#                                                                             #
#                   F. MONNIOT SETTINGS - INSTALL SCRIPT                      #
#                                                                             #
###############################################################################
# 
# Create all symlinks needed for personnalized configuration
#
SETTINGS_DIR="$HOME/.settings"
RVM_DIR="$HOME/.rvm"

### GIT Initialization
hash git 2>&- || { echo >&2 "Missing Git!"; exit 1; }

if [ ! -d $SETTINGS_DIR ]; then
  git clone -q https://github.com/francoismonniot/.settings.git $SETTINGS_DIR
  [ ! -d $SETTINGS_DIR ] && { echo "Could not clone the settings repository."; exit 1; }
else
  cd $SETTINGS_DIR && git pull -q
fi

### ZSH CONFIG ###
echo "Configure ZSH config files"

if [ -f ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc.old
fi
ln -s $SETTINGS_DIR/oh-my-zsh/.zshrc ~/.zshrc

if [ -f $SETTINGS_DIR/.zsh_history ]; then
	mv ~/.zsh_history ~/.settings/oh-my-zsh/.zsh_history
	ln -s $SETTINGS_DIR/oh-my-zsh/.zsh_history ~/.zsh_history
else
	touch $SETTINGS_DIR/oh-my-zsh/.zsh_history
fi

### RVM Installation ###

hash curl 2>&- || { echo >&2 "Missing curl!"; exit 1; }

curl -L get.rvm.io | bash -s stable

ln -s $SETTINGS_DIR/.gemrc $HOME/.gemrc
