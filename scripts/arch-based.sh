#!/usr/bin/env bash

sudo pacman -S --noconfirm bash-completion vim python python-pip neovim \
python-neovim python2-neovim ack tree wget nginx tmux markdown irssi zsh \
xclip cmake mono firefox extra/ffmpeg obs-studio autoconf bison \
community/openshot ngrep highlight winetricks virtualbox docker-compose \
libffi libyaml openssl zlib composer clang powertop tlp yarn

gpg --recv-keys --keyserver hkp://pgp.mit.edu D9C4D26D0E604491
gpg --recv-keys --keyserver hkp://pgp.mit.edu 5CC908FDB71E12C2

yaourt -Sy \
  chrome-gnome-shell-git \
  dropbox \
  lib32-gnutls \
  lib32-libldap \
  libcurl-openssl-1.0 \
  libtinfo \
  nautilus-dropbox \
  silver-searcher-git \
  spotify \
  visual-studio-code

# This is a fix to get version 5 for Ycm
sudo ln -s /usr/lib/libtinfo.so /usr/lib/libtinfo.so.5

source scripts/common.sh
