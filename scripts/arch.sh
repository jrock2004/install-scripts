#!/usr/bin/env bash

sudo pacman -Sy \
  cabextract \
  chrome-gnome-shell \
  mono \
  ngrep \
  neovim \
  nodejs \
  obs-studio \
  openshot \
  python-neovim \
  python2-neovim \
  ruby2.4 \
  the_silver_searcher \
  tmux \
  vim \
  xclip \
  yarn \
  zsh

yaourt -S \
  visual-studio-code-bin \
  visual-studio-code-insiders \
  wine-stable

# Install Winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv -v winetricks /usr/local/bin

source scripts/common.sh
