#!/usr/bin/env bash

echo -e "\nAdd some external sources"

# Sources for Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Sources for .net core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Sources for Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian xenial main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# Sources for NodeJS 8
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Sources for Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Lets updated so we can get new sources
sudo apt-get update

sudo apt-get -y install \
  bash-completion \
  bison \
  build-essential \
  ca-certificates \
  clang \
  cmake \
  exuberant-ctags \
  highlight \
  irssi \
  irssi-scripts \
  markdown \
  mono-complete \
  neovim \
  ngrep \
  nodejs \
  openshot \
  openssl \
  python-dev \
  python-pip \
  python-setuptools \
  python3-dev \
  python3-pip \
  ruby2.3 \
  ruby2.3-dev \
  silversearcher-ag \
  tmux \
  tree \
  unzip \
  vim \
  vim-scripts \
  xclip \
  yarn \
  zlibc \
  zlib1g-dev \
  zsh

source scripts/common.sh
