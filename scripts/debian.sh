#!/usr/bin/env bash

# Adding some sources
##############################
sudo add-apt-repository ppa:lazygit-team/release

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
  ack \
  bat \
  cabextract \
  cmake \
  exuberant-ctags \
  fzf \
  gcc \
  gnupg \
  grep \
  highlight \
  htop \
  hub \
  kitty \
  lazygit \
  mono-devel \
  neofetch \
  neovim \
  ngrep \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ripgrep \
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

# Need to link grep to directory that our configs are looking
sudo ln -sf /bin/grep /usr/bin/grep

# Install fnm
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell

# Install Lazy Docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

