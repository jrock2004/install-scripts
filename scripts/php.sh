#!/usr/bin/env bash

curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

if [ ! -d ~/.composer ]; then
  mkdir ~/.composer
fi

if [ "$OS" = "darwin" ]; then
  sudo chown -R $USER:staff $HOME/.composer
else
  sudo chown -R $USER:users $HOME/.composer
fi

# Link the composer.json file
echo "{}" > $HOME/.composer/composer.json

# Cleanup
rm composer-setup.php

# Install Laravel
/usr/local/bin/composer global require "laravel/installer"
