#!/usr/bin/env bash

#### Variables ####

# Edit these to match your liking

EMAIL="jrock2004@gmail.com"
DEVFOLDER="$HOME/Development"
BIN="$HOME/bin"
DOTFILESGITHUB="https://github.com/jrock2004/dotfiles.git"
OS=''

###################

#### Functions ####

# A function to check if a command exists
command_exists() {
  type "$1" > /dev/null 2>&1
}

###################

# Ask the user what OS they are running instead of trying to guess
PS3='Which OS are you running: '
options=("Arch" "Bash on Windows" "Apple" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "Arch")
      OS='arch'
      break
      ;;
    "Bash on Windows")
      OS='microsoft'
      break
      ;;
    "Apple")
        OS='mac'
        break
        ;;
    "Quit")
      exit 0
      break
      ;;
    *) echo invalid option;;
  esac
done

# Create some directories
echo -e "\n Creating some default directories that we will be using"
mkdir -p $BIN

if [ "$OS" = "microsoft" ]; then
  ln -s /mnt/c/Development $DEVFOLDER
else
  mkdir -p $DEVFOLDER
fi

# Lets pull in my dotfiles
echo -e "\nGrabbing dotfiles and putting them into ~/.dotfiles"
git clone $DOTFILESGITHUB $HOME/.dotfiles

# Installing the apps that are needed
if [[ ("$OS" = "debian") || ("$OS" = "microsoft") ]]; then
  source scripts/debian.sh
elif [ "$OS" = "arch" ]; then
  source scripts/arch.sh
elif [ "$OS" = "mac" ]; then
  source scripts/mac.sh
else
  echo -e "\nCould not detect OS/distro. Stopping execution"
  exit 0
fi

# Symlink from .dotfiles to your home directory
echo -e "Symlinking files and folders from dotfiles to home directory"
source scripts/link.sh

source scripts/fonts.sh

# Installing Node Apps
echo -e "Installing global node apps via yarn"
source scripts/yarn.sh

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
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

# Setting env to zsh instead of bash
echo "Switching to ZSH"
if ! command_exists zsh; then
  echo "zsh not found. Please install and then re-run installation scripts"
  exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
  echo "Configuring zsh as default shell"
  sudo usermod -s $(which zsh) $(whoami)
fi

echo -e "\nScript has completed. You can now delete the install scripts folder as its no longer needed"
