#!/usr/bin/env bash

sudo pacman -Sy \
  ack \
  bat \
  cabextract \
  cmake \
  ctags \
  diff-so-fancy \
  docker \
  docker-compose \
  fzf \
  gcc \
  gnupg \
  grep \
  highlight \
  htop \
  hub \
  kitty \
  mono \
  neofetch \
  neovim \
  ngrep \
  python \
  python2 \
  ripgrep \
  ruby2.5 \
  the_silver_searcher \
  tmux \
  vim \
  xclip \
  zsh

sudo systemctl enable docker.service

pip install pynvim
pip3 install pynvim

# Install fnm
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell

# Install Lazy Docker
# curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

