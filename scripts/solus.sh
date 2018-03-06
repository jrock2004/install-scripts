#!/usr/bin/env bash

# Adding some sources
##############################

if [ "$OS" = "microsoft" ]; then
  # Neovim repo
  sudo add-apt-repository ppa:neovim-ppa/stable
else
  # VS Code
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi


# Installing some apps
###############################

sudo eopkg -y install \
  cabextract \
  cmake \
  ctags \
  gcc \
  mono-devel \
  neovim \
  #ngrep \
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
