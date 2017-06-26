#!/usr/bin/env bash

#### Variables ####

# Edit these to match your liking

EMAIL="jrock2004@gmail.com"
DEVFOLDER="$HOME/Development"
DOWNLOADS="$HOME/Downloads"
BIN="$HOME/bin"
DOTFILESGITHUB="https://github.com/jrock2004/dotfiles.git"

###################

#### Functions ####

# A function to check if a command exists
command_exists() {
  type "$1" > /dev/null 2>&1
}

# Get what OS/distro you are using
OS=$(lsb_release -si)

###################

# Create some directories
echo -e "\n Creating some default directories that we will be using"
mkdir -p $DEVFOLDER
mkdir -p $BIN
mkdir -p $DOWNLOADS

# Lets pull in my dotfiles
echo -e "\nGrabbing dotfiles and putting them into ~/.dotfiles"
git clone $DOTFILESGITHUB $HOME/.dotfiles

# Symlink from .dotfiles to your home directory
echo -e "Symlinking files and folders from dotfiles to home directory"
source scripts/link.sh

# Installing the apps that are needed
echo -e "Trying to install some apps"
if [[ ("$OS" = "Ubuntu") || ("$OS" = "elementary") ]]; then
  source scripts/debian-based.sh
elif [ "$OS" = "Arch" ]; then
  source scripts/arch-based.sh
else
  echo -e "\nCould not detect OS/distro. Skipping app install"
fi

# Installing some python modules
echo -e "Installing needed python modules"
source scripts/python.sh

# Installing Node Apps
echo -e "Installing global node apps via yarn"
source scripts/yarn.sh

# Installing Ruby stuff
echo -e "Installing ruby and some needed dependencies"
source scripts/ruby.sh

# Installing Fonts
echo -e "Installing some global fonts that I like to use"
source scripts/fonts.sh

# Installing PHP stuff
echo -e "Installing composer"
source scripts/php.sh

# installing resource files
echo -e "Adding some TERMINFO support for the terminal"
tic $HOME/.dotfiles/resources/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/resources/tmux-256color-italic.terminfo

# Setup SSH key if needed
echo -e "Setting up an SSH key to use for github"
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/id_rsa.pub  ]; then
  ssh-keygen -t rsa -b 4096 -C "$EMAIL"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  GITHUB_SSH_URL=https://github.com/settings/ssh

  if command_exists xdg-open; then
    xdg-open $GITHUB_SSH_URL
  else
    echo $GITHUB_SSH_URL
  fi

  cat $HOME/.ssh/id_rsa.pub

  read -p "`echo $'\n\n'` Hit ENTER after adding to Github `echo $'\n\n'`"
else
  echo ".ssh directory already exists, not generating"
fi

if ! command_exists zplug; then
  echo "installing zplug, a plugin manager for zsh - http://zplug.sh"
  # curl -sL zplug.sh/installer | zsh
  git clone https://github.com/zplug/zplug.git ~/.zplug
fi

# Setting env to zsh instead of bash
echo "Switching to ZSH"
if ! command_exists zsh; then
  echo "zsh not found. Please install and then re-run installation scripts"
  exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
  echo "Configuring zsh as default shell"
  chsh -s $(which zsh)
fi

echo -e "\nScript has completed. You can now delete the install scripts folder as its no longer needed"
