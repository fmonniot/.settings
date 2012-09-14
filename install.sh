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
  git clone -q https://github.com/fmonniot/.settings.git $SETTINGS_DIR
  [ ! -d $SETTINGS_DIR ] && { echo "Could not clone the settings repository."; exit 1; }
else
  cd $SETTINGS_DIR && git pull -q
fi

### ZSH CONFIG ###
echo "Configure ZSH config files"

if [ -f ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc.old
fi
ln -s $SETTINGS_DIR/zshrc ~/.zshrc

if [ -f ~/.zsh_history ]; then
	mv ~/.zsh_history $SETTINGS_DIR/zsh_history
  else
	touch $SETTINGS_DIR/zsh_history
fi
ln -s $SETTINGS_DIR/zsh_history ~/.zsh_history

### Git global config  ###
echo "Configure git preferences"

if [ -f ~/.gitconfig ]; then
	mv ~/.gitconfig mv ~/.gitconfig.old
fi
ln -s $SETTINGS_DIR/gitconfig ~/.gitconfig

### RVM Installation ###

hash curl 2>&- || { echo >&2 "Missing curl!"; exit 1; }

curl -L get.rvm.io | bash -s stable

ln -s $SETTINGS_DIR/.gemrc $HOME/.gemrc
