#!/usr/bin/env bash

sudo yarn global add \
  all-the-package-names \
  csslint \
  diff-so-fancy \
  eslint \
  git-standup \
  jscs \
  jshint \
  jsonlint \
  jsxhint \
  tslint \
  typescript

# Fix permissions on config dir
sudo chown -R $USER $HOME/.config
