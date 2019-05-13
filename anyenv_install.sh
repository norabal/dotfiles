#!/bin/bash

set -u

echo "Initialize anyenv..."
anyenv install --init -y

echo "Install anyenv plugin..."
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
echo "`anyenv update` is available now."

echo "Install anyenv series..."
anyenv install nodenv
anyenv install rbenv
source "${HOME}/.zshrc"

nodenv install 12.1.0
nodenv global 12.1.0
nodenv rehash

rbenv install 2.5.3
rbenv global 2.5.3
rbenv rehash

cat << END

**************************************************
ANYENV INSTALLED! bye.
**************************************************

END
