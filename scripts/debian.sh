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
	highlight \
	mono-devel \
	neovim \
	ngrep \
	nodejs \
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
	yarn \
	zplug \
	zsh

pip install --upgrade pip
pip install --user --upgrade neovim
pip3 install --user --upgrade neovim

# Need to link grep to directory that our configs are looking
sudo ln -sf /bin/grep /usr/bin/grep

source scripts/common.sh
