#!/usr/bin/env bash

# Test to see if brew is installed, if not, install it
if ! command_exists brew; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

formulas=(
  # flags should pass through the the `brew list check`
  'macvim --with-override-system-vim'
  ack
  diff-so-fancy
  git
  'grep --with-default-names'
  neovim/neovim/neovim
  reattach-to-user-namespace
  the_silver_searcher
  tmux
  wget
  yarn
  zsh
)

for formula in "${formulas[@]}"; do
  if brew list "$formula" > /dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    brew install $formula
  fi
done

# Setup fzf
/usr/local/opt/fzf/install

brew tap caskroom/versions

### Installing GUI Apps
brew cask install google-chrome
brew cask install 1password
brew cask install alfred
brew cask install bartender
brew cask install dropbox
brew cask install firefox
brew cask install iterm2
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install Spectacle
brew cask install ishowu-hd
brew cask install visual-studio-code

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
