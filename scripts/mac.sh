#!/usr/bin/env bash

# Test to see if brew is installed, if not, install it
if test ! "$( command -v brew )"; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

touch $HOME/.profile

brew bundle

/usr/local/opt/fzf/install --all --no-bash --no-fish
pip3 install pynvim

# A fix for neovim startify
mkdir -p ~/.vim/files/info
