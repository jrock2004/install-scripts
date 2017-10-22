#!/usr/bin/env bash

if [ "$OS" = "darwin" ]; then
  sudo easy_install pip
fi

pip install --upgrade pip

pip install --user neovim

if command_exists pip3; then
  pip3 install --upgrade pip
  pip3 install --user neovim
fi
