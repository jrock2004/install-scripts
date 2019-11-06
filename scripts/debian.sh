#!/usr/bin/env bash

# Adding some sources
##############################

if [ "$OS" = "microsoft" ]; then
	# Neovim repo
	sudo apt-get -y install software-properties-common apt-transport-https
fi

if [ "$OS" = "debian" ]; then
	sudo mkdir /usr/local/opt
	sudo chown -R jcostanzo /usr/local/opt
  sudo chmod -R 775 /usr/local/opt
fi

# Installing some apps
###############################

sudo apt-get -y install \
  cabextract \
  cmake \
  exuberant-ctags \
  gcc \
  grep \
  highlight \
  mono-devel \
  neovim \
  ngrep \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ruby2.5 \
  ruby2.5-dev \
  silversearcher-ag \
  tmux \
  vim \
  xclip \
  zsh

# Install some python nvim dep
pip install pynvim
pip3 install pynvim

curl -LO https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

# Need to link grep to directory that our configs are looking
sudo ln -sf /bin/grep /usr/bin/grep

# Install fnm
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
sudo cp $HOME/.fnm/fnm /usr/local/bin

source scripts/common.sh
