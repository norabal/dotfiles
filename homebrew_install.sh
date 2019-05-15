#!/bin/bash

set -u

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

formulas=(
    anyenv
    awscli
    cookiecutter
    ctags
    ctags-exuberant
    curl
    direnv
    docker
    git
    git-secrets
    heroku
    jenkins
    macvim
    make
    mecab-ipadic
    mongodb
    mysql
    nginx
    nkf
    openssl
    postgres
    pyenv
    python3
    rabbitmq
    redis
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

cask_formulas=(
    appcleaner
    clipy
    google-chrome
    intellij-idea
    karabiner-elements
    meld
    ngrok
    the-unarchiver
)

echo "brew tap..."
brew tap caskroom/cask

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install "$formula" || brew upgrade "$formula"
done

echo "start brew install cask apps..."
for formula in "${cask_formulas[@]}"; do
    brew cask install "$formula" || brew cask upgrade "$formula"
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
