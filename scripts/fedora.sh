#!/usr/bin/env bash

echo -e "\n Adding some extenal sources"

# Install RPM fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Sources for MS
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod\nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'

# Sources for Spotify
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-spotify.repo

# Sources for Yarn
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

# Lets updated so we can use the new sources
sudo dnf check-update

# Installing some apps
sudo dnf -y install \
  cabextract \
  chrome-gnome-shell \
  cmake \
  code \
  ctags \
  dropbox \
  gcc \
  gcc-c++ \
  kernel-headers \
  kernel-devel \
  mono-devel \
  nautilus-dropbox \
  neovim \
  ngrep \
  nodejs \
  obs-studio \
  openshot \
  python-devel \
  python2-neovim \
  python3-devel \
  python3-neovim \
  rubygems \
  spotify-client \
  the_silver_searcher \
  tmux \
  vim \
  wine \
  xclip \
  yarn \
  zsh
  
source scripts/common.sh

# Install Winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv -v winetricks /usr/local/bin
  
