#!/usr/bin/env bash

sudo yarn global add \
  all-the-package-names \
<<<<<<< HEAD
  csslint \
  diff-so-fancy \
  eslint \
  git-standup \
=======
  browser-sync \
  csslint \
  diff-so-fancy \
  ember-cli \
  eslint \
  express-generator \
  firebase-tools \
  generator-aspnet \
  pug-lint \
>>>>>>> old
  jscs \
  jshint \
  jsonlint \
  jsxhint \
<<<<<<< HEAD
=======
  preact-cli \
  sass \
>>>>>>> old
  tslint \
  typescript

# Fix permissions on config dir
sudo chown -R $USER $HOME/.config
