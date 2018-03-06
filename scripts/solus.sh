#!/usr/bin/env bash

# Installing some apps
###############################

sudo eopkg -y install \
  cabextract \
  cmake \
  ctags \
  gcc \
  mono-devel \
  neovim \
  nodejs \
  obs-studio \
  openshot-qt \
  pip \
  python3 \
  python3-devel \
  ruby \
  ruby-neovim \
  silver-searcher \
  tmux \
  vim \
  vscode \
  wine-devel \
  xclip \
  yarn \
  zsh

# Install python modules
pip install --user --upgrade neovim
pip3 install --user --upgrade neovim

# Install Winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv -v winetricks /usr/local/bin

source scripts/common.sh
