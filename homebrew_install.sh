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
    bash
    cookiecutter
    circleci
    ctags
    ctags-exuberant
    curl
    direnv
    git
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
    yarn
    zsh
    zsh-completions
)

cask_formulas=(
    appcleaner
    bettertouchtool
    clipy
    dbeaver-community
    docker
    google-chrome
    google-japanese-ime
    homebrew/cask-versions/adoptopenjdk8
    intellij-idea
    iterm2
    karabiner-elements
    meld
    ngrok
    skitch
    slack
    spotify
    the-unarchiver
)

echo "brew tap..."
brew tap caskroom/cask
brew tap heroku/brew

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
