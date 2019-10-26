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
fi

# Yarn
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# NodeJS
# curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -



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
  wget \
	xclip \
	zplug \
	zsh

curl -LO https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd.deb

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

pip3 install pynvim

# Need to link grep to directory that our configs are looking
sudo ln -sf /bin/grep /usr/bin/grep

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

source scripts/common.sh
