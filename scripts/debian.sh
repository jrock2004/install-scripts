#!/usr/bin/env bash

# Adding some sources
##############################

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

# Installing some apps
###############################
sudo apt-get -y install \
  cabextract \
  chrome-gnome-shell \
  cmake \
  code \
  exuberant-ctags \
  gcc \
  mono-devel \
  neovim \
  ngrep \
  nodejs \
  obs-studio \
  openshot \
  python-dev \
  python3-dev \
  ruby2.3 \
  silversearcher-ag \
  tmux \
  vim \
  wine-development \
  xclip \
  yarn \
  zsh

source scripts/common.sh

# Install Winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv -v winetricks /usr/local/bin

