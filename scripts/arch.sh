#!/usr/bin/env bash

sudo pacman -Sy \
	aurman \
  bat \
	cabextract \
  cmake \
	ctags \
	diff-so-fancy \
	docker \
	docker-compose \
  gcc \
  grep \
	mono \
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

aurman -S \
	slack-desktop \
	spotify \
	visual-studio-code-bin \
	visual-studio-code-insiders

sudo systemctl enable docker.service

pip install pynvim
pip3 install pynvim

# Install fnm
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell

source scripts/common.sh
