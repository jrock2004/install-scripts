#!/usr/bin/env bash

# Install some extra tools
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

cp $HOME/.fzf/bin/fzf /usr/local/opt
