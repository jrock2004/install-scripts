#!/usr/bin/env bash

sudo pacman -S --noconfirm bash-completion vim python python-pip neovim \
python-neovim python2-neovim ack tree wget nginx tmux markdown irssi zsh \
xclip cmake mono firefox extra/ffmpeg obs-studio autoconf bison \
community/openshot ngrep highlight winetricks virtualbox docker-compose \
libffi libyaml openssl zlib composer clang powertop tlp yarn

gpg --recv-keys --keyserver hkp://pgp.mit.edu D9C4D26D0E604491
gpg --recv-keys --keyserver hkp://pgp.mit.edu 5CC908FDB71E12C2

yaourt -Sy spotify silver-searcher-git visual-studio-code dropbox \
nautilus-dropbox libcurl-openssl-1.0 lib32-libldap \
lib32-gnutls chrome-gnome-shell-git

source scripts/common.sh
