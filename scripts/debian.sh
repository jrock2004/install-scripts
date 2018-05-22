#!/usr/bin/env bash

# Adding some sources
##############################

if [ "$OS" = "microsoft" ]; then
  # Neovim repo
  sudo apt-get -y install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable
else
  # VS Code
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Installing some apps
###############################

sudo apt-get -y install \
  cabextract \
  cmake \
  exuberant-ctags \
  gcc \
  mono-devel \
  neovim \
  ngrep \
  nodejs \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ruby2.3 \
  silversearcher-ag \
  tmux \
  vim \
  xclip \
  yarn \
  zsh


if [ "$OS" = "microsoft" ]; then
  pip install --upgrade pip
  pip install --user --upgrade neovim
  pip3 install --user --upgrade neovim
else
  sudo apt-get -y install \
    chrome-gnome-shell \
    code \
    obs-studio \
    openshot \
    wine-development

  # Install Winetricks
  wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
  chmod +x winetricks
  sudo mv -v winetricks /usr/local/bin
fi

source scripts/common.sh

