#!/bin/bash

set -u

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

formulas=(
    awscli
    bash
    cookiecutter
    ctags
    curl
    git
    git-secrets
    go
    heroku
    jenkins
    make
    mecab-ipadic
    mongodb
    mysql
    nginx
    nkf
    node
    openssl
    perl
    php
    pyenv
    python3
    rabbitmq
    rbenv
    redis
    ruby
    s3cmd
    shellcheck
    sqlite
    sshrc
    swig
    terraform
    tmux
    tree
    zsh
    zsh-completions
)

echo "brew tap..."
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install "$formula" || brew upgrade "$formula"
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
