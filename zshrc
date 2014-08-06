# Path to your oh-my-zsh configuration.
SETTINGS=$HOME/.settings
ZSH=$SETTINGS/oh-my-zsh

# source rvm if exist and add it to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && export PATH=$PATH:"$HOME/.rvm/bin"

# Customize the PATH
export PATH=$PATH:$SETTINGS/bin

# Load android sdk (classic and/or studio)
[[ -s "/opt/android-sdk/platform-tools" ]] && export PATH=$PATH:"/opt/android-sdk/platform-tools"
[[ -s "/opt/android-sdk/tools" ]] && export PATH=$PATH:"/opt/android-sdk/tools"
[[ -s "/opt/android-studio/sdk/platform-tools" ]] && export PATH=$PATH:"/opt/android-studio/sdk/platform-tools"
[[ -s "/opt/android-studio/sdk/tools" ]] && export PATH=$PATH:"/opt/android-studio/sdk/tools"

# Auto completion for the gcloud && appcfg.py commands in Google Cloud SDK
fpath=($SETTINGS/gcloud-zsh-completion/src $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fabric git-flow pip symfony2 ruby rvm gem rails bundler cp systemd)

# Sourcing Oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set default editor
export EDITOR="nano"

# Maven configuration
export M2_HOME=/opt/maven
export M2=$M2_HOME/bin

export PATH=$M2:$PATH

# Chrome config
export CHROME_BIN=/usr/bin/chromium

# Use python 2 for the sdk
export CLOUDSDK_PYTHON=/usr/bin/python2

# The next line updates PATH for the Google Cloud SDK.
source /home/francois/google-cloud-sdk/path.zsh.inc

