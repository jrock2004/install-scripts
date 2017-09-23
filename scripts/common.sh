#!/usr/bin/env bash

# Install some extra tools
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# Setup groups
sudo usermod -aG docker $USER

if [ "$OS" != "fedora" ]; then
  # Install rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p $HOME/.rbenv/plugins
  git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# Get Tmux spotify client
sudo curl https://raw.githubusercontent.com/jrock2004/tmux-spotify/master/tmux-spotify -o /usr/local/bin/tmux-spotify

sudo chmod +x /usr/local/bin/tmux-spotify

# Setting some dconf settings

# Set clock
gsettings set org.gnome.desktop.interface clock-format 12h

# Touchpad settings
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Screensaver settings
gsettings set org.gnome.desktop.screensaver lock-enabled true

# Nautilus settings
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# File roller Settings
gsettings set org.gnome.file-roller.file-selector show-hidden true

# Set screenshot settings
gsettings set org.gnome.gnome-screenshot default-file-type jpg

# Set auto timezone
gsettings set org.gnome.desktop.datetime automatic-timezone true
