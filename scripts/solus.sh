#!/usr/bin/env bash

# Installing some apps
###############################

sudo eopkg -y install \
  cabextract \
  cmake \
  ctags \
  diffutils \
  docker \
  docker-compose \
  gcc \
  kitematic \
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

source scripts/common.sh
