#!/usr/bin/env bash

# Adding some sources
##############################

if [ "$OS" = "microsoft" ]; then
	# Neovim repo
	sudo apt-get -y install software-properties-common apt-transport-https
# else
	# VS Code
	# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	# sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	# sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
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


if [ "$OS" = "microsoft" ]; then
	pip install --upgrade pip
	pip install --user --upgrade neovim
	pip3 install --user --upgrade neovim
else
	sudo apt-get -y install \
		chrome-gnome-shell \
		code \
		firefox \
		gnome-tweak-tool \
		obs-studio \
		openshot \
		slack \
		wine-development

	# Install Winetricks
	wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	chmod +x winetricks
	sudo mv -v winetricks /usr/local/bin
fi

# Need to link grep to directory that our configs are looking
sudo ln -sf /bin/grep /usr/bin/grep

source scripts/common.sh
