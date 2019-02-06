#!/usr/bin/env bash

# Test to see if brew is installed, if not, install it
if test ! "$( command -v brew )"; then
	echo "Installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

formulas=(
	bat
	diff-so-fancy
	git
	neovim
	python
	reattach-to-user-namespace
	the_silver_searcher
	tmux
	tree
	vim
	wget
	zplug
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

# Install pip
sudo easy_install pip
pip install --user --upgrade neovim
pip3 install --user --upgrade neovim

brew tap caskroom/versions

casks=(
	alfred
	atom
	discord
	docker
	dropbox
	firefox
	google-chrome
	ishowu-hd
	iterm2
	minikube
	slack
	spectacle
	spotify
	visual-studio-code
	1password
)

### Installing GUI Apps
for cask in "${casks[@]}"; do
	cask_name=$( echo "$cask" | awk '{print $1}' )

	if brew list "$cask_name" > /dev/null 2>&1; then
		echo "$cask_name already installed... skipping."
	else
		brew cask install "$cask"
	fi
done

# Installing nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts

brew install yarn --without-node

source scripts/vscodeext.sh

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit
sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/

echo -e "\n\nSetting OS X settings"
echo "=============================="

# echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# echo "show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

# echo "only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

# echo "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

# Install some extra tools
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# A fix for neovim startify
mkdir -p ~/.vim/files/info
