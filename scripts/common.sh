#!/usr/bin/env bash

# Install some extra tools
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# Get Tmux spotify client
sudo curl https://raw.githubusercontent.com/jrock2004/tmux-spotify/master/tmux-spotify -o /usr/local/bin/tmux-spotify

sudo chmod +x /usr/local/bin/tmux-spotify

# Setting some dconf settings

# Set clock
gsettings set org.gnome.desktop.interface clock-format 12h

# Screensaver settings
gsettings set org.gnome.desktop.screensaver lock-enabled true

# Nautilus settings
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Set screenshot settings
gsettings set org.gnome.gnome-screenshot default-file-type jpg

# Set auto timezone
gsettings set org.gnome.desktop.datetime automatic-timezone true

