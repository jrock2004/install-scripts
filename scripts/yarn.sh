#!/usr/bin/env bash

sudo yarn global add \
  all-the-package-names \
  csslint \
  diff-so-fancy \
  eslint \
  git-standup \
  browser-sync \
  csslint \
  diff-so-fancy \
  ember-cli \
  eslint \
  express-generator \
  firebase-tools \
  generator-aspnet \
  pug-lint \
  jscs \
  jshint \
  jsonlint \
  jsxhint \
  preact-cli \
  sass \
  tslint \
  typescript

# Fix permissions on config dir
sudo chown -R $USER $HOME/.config
