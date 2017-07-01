#!/usr/bin/env bash

OS=$(lsb_release -si)

if [ "$OS" = "elementary" ]; then
  echo -e "Adding a prereq"
  sudo apt-get install -y software-properties-common python-software-properties
  source ~/.bashrc
fi

echo -e "\nAdd some external sources"

# Sources for Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Sources for .net core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Sources for Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# Sources for Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Sources for OBS
sudo apt-add-repository ppa:obsproject/obs-studio

# Sources for Docker
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

# Sources for Virtualbox
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'

# Sources for Neofetch
sudo add-apt-repository ppa:dawidd0811/neofetch

# Sources for Openshot
sudo add-apt-repository ppa:openshot.developers/ppa

# Sources for Ruby
sudo apt-add-repository ppa:brightbox/ruby-ng

# Sources for NodeJS 8
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Sources for Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Lets updated so we can get new sources
sudo apt-get update

sudo apt-get -y install ack-grep \
  apt-transport-https \
  autoconf \
  bash-completion \
  bison \
  build-essential \
  ca-certificates \
  clang \
  cmake \
  composer \
  docker \
  docker-compose \
  exuberant-ctags \
  ffmpeg \
  firefox-dev \
  highlight \
  irssi \
  irssi-scripts \
  libffi-dev \
  libsqlite3-dev \
  libyaml-dev \
  linux-image-extra-$(uname -r) \
  linux-image-extra-virtual \
  markdown \
  mono-complete \
  neofetch \
  neovim \
  nginx \
  ngrep \
  nodejs \
  obs-studio \
  openshot-qt \
  openssl \
  php-cli \
  php-mbstring \
  php-mcrypt \
  php-mysql \
  php-sqlite3 \
  php-xml \
  php-zip \
  powertop \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ruby2.3 \
  ruby2.3-dev \
  silversearcher-ag \
  spotify-client \
  sqlite3 \
  tmux \
  tree \
  tlp \
  unzip \
  vim \
  vim-scripts \
  virtualbox \
  xclip \
  yarn \
  zlibc \
  zsh \

source scripts/common.sh

# Install google chrome
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o ~/Downloads/google-chrome-stable_current_amd64.deb

sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt-get -f install
rm ~/Downloads/google-chrome*

# Install Visual Studio code
curl -o $HOME/bin/code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i $HOME/bin/code.deb
sudo apt-get -f install
rm -Rf $HOME/bin/code.deb

if [ "$OS" = "elementary" ]; then
  # Install dropbox
  git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox/tmp/elementary-dropbox/install.sh

  # Lock on lid close
  gsettings set apps.light-locker lock-on-lid true

  # Set screenshot settings
  gsettings set net.launchpad.screenshot format jpg

  # Mouse Settings
  gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true

  # Battery Settings
  gsettings set org.pantheon.desktop.wingpanel.indicators.power show-percentage true

  # Pant Files Settings
  gsettings set org.pantheon.files.preferences single-click false

  # Scratch
  gettings set org.pantheon.scratch.settings auto-indent true
  gettings set org.pantheon.scratch.settings autosave false
  gettings set org.pantheon.scratch.settings highlight-current-line true
  gettings set org.pantheon.scratch.settings show-right-margin true

  # Unsafe paste alert
  gettings set org.pantheon.terminal.settings font "monofur for Powerline 16"
  gettings set org.pantheon.terminal.settings remember-tabs false
  gettings set org.pantheon.terminal.settings save-exited-tabs false
  gettings set org.pantheon.terminal.settings tab-bar-behavior "Hide When Single Tab"
  gettings set org.pantheon.terminal.settings unsafe-paste-alert false
fi
