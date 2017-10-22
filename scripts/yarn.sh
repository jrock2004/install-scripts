#!/usr/bin/env bash

sudo yarn global add \
  all-the-package-names \
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
  typescript \
  yo

# Fix permissions on config dir
sudo chown -R $USER $HOME/.config
