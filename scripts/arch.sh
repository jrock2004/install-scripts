#!/usr/bin/env bash

sudo pacman -Sy \
  aurman \
  cabextract \
  chrome-gnome-shell \
  ctags \
  diff-so-fancy \
  docker \
  docker-compose \
  mono \
  ngrep \
  neovim \
  nodejs \
  obs-studio \
  openshot \
  python-neovim \
  python2-neovim \
  ruby2.4 \
  the_silver_searcher \
  tmux \
  vim \
  xclip \
  yarn \
  zsh

aurman -S \
  visual-studio-code-bin \
  visual-studio-code-insiders

source scripts/common.sh
