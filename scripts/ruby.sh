#!/usr/bin/env bash

if [ "$OS" != "fedora" ]; then
  # Setup ruby
  $HOME/.rbenv/bin/rbenv install 2.3.4
  $HOME/.rbenv/bin/rbenv global 2.3.4

  echo 'eval "$(rbenv init -)"' >> ~/.bashrc

  echo "Installing some Gems"
  $HOME/.rbenv/shims/gem install bundler scss_lint neovim
fi
