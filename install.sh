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
options=("Apple" "Linux" "Bash on Windows" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Linux")
			OS='debian'
			break
			;;
		"Bash on Windows")
			OS='microsoft'
			break
			;;
		"Apple")
			OS='darwin'
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
	echo -e "\n Creating a symlink so we do not corrupt code in folder"
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
elif [ "$OS" = "darwin" ]; then
	source scripts/mac.sh
else
	echo -e "\nCould not detect OS/distro. Stopping execution"
	exit 0
fi

# Symlink from .dotfiles to your home directory
echo -e "Symlinking files and folders from dotfiles to home directory"
source scripts/link.sh

source scripts/fonts.sh

source scripts/git.sh

# Setting env to zsh instead of bash
echo "Switching to ZSH"
if ! command_exists zsh; then
	echo "zsh not found. Please install and then re-run installation scripts"
	exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
	echo "Configuring zsh as default shell"

	if [[ "$OS" = "darwin" ]]; then
		zsh_path="$( command -v zsh )"

		if ! grep "$zsh_path" /etc/shells; then
			echo "adding $zsh_path to /etc/shells"
			echo "$zsh_path" | sudo tee -a /etc/shells
		fi

		if [[ "$SHELL" != "$zsh_path" ]]; then
			chsh -s "$zsh_path"
			echo "default shell changed to $zsh_path"
		fi
	else
		sudo usermod -s $(which zsh) $(whoami)
	fi
fi

echo -e "\nRestart your terminal and do fnm install 10.17.0 && fnm use 10.17.0"
echo -e "\nScript has completed. You can now delete the install scripts folder as its no longer needed"
