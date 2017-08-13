#!/usr/bin/env bash

sudo yarn global add \
  all-the-package-names \
  bower \
  browser-sync \
  csslint \
  diff-so-fancy \
  ember-cli \
  ember-cli-azure-deploy \
  eslint \
  express-generator \
  firebase-tools \
  generator-aspnet \
  git-standup \
  gulp \
  handlebars \
  pug-lint \
  jscs \
  jshint \
  jsonlint \
  jsxhint \
  less \
  nodemon \
  phplint \
  preact-cli \
  sass \
  tslint \
  typescript \
  yo

# Fix permissions on config dir
sudo chown -R $USER $HOME/.config
