#!/usr/bin/env bash

if [ "$OS" != "fedora" ]; then
  echo "Installing some Gems"
  $HOME/.rbenv/shims/gem install bundler scss_lint neovim
else
  gem install bundler scss_lint
fi
