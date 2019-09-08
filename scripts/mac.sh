#!/usr/bin/env bash

# Test to see if brew is installed, if not, install it
if test ! "$( command -v brew )"; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

touch $HOME/.profile

formulas=(
  bat
  diff-so-fancy
  fzf
  git
  grep
  highlight
  hub
  "neovim --head"
  "node@10"
  python
  reattach-to-user-namespace
  ripgrep
  the_silver_searcher
  tmux
  tree
  vim
  wget
  "yarn --ignore-dependencies"
  z
  zsh
)

for formula in "${formulas[@]}"; do
  formula_name=$( echo "$formula" | awk '{print $1}' )

  if brew list "$formula_name" > /dev/null 2>&1; then
    echo "$formula_name already installed... skipping."
  else
    brew install "$formula"
  fi
done

/usr/local/opt/fzf/install
pip3 install pynvim

casks=(
  alfred
  discord
  docker
  dropbox
  firefox
  google-chrome
  iterm2
  slack
  spectacle
  visual-studio-code
)

### Installing GUI Apps
for cask in "${casks[@]}"; do
  cask_name=$( echo "$cask" | awk '{print $1}' )

  echo "$cask_name \\n"
done

# A fix for neovim startify
mkdir -p ~/.vim/files/info
