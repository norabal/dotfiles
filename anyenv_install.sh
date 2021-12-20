#!/bin/bash

set -u

echo "Initialize anyenv..."
anyenv install --init

echo "Install anyenv plugin..."
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
echo "`anyenv update` is available now."

echo "Install anyenv series..."
anyenv install nodenv
anyenv install rbenv

# Reload profile
exec $SHELL -l

# Add more versions if you prefer.
nodenv install 12.13.1
nodenv global 12.13.1
nodenv rehash

rbenv install 2.7.3
rbenv global 2.7.3
rbenv rehash

echo "Installed versions..."
anyenv versions

cat << END

**************************************************
ANYENV INSTALLED! bye.
**************************************************

END
