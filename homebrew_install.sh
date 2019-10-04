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
    awslogs
    bash
    cookiecutter
    circleci
    ctags
    ctags-exuberant
    curl
    direnv
    flake8
    git
    heroku
    jenkins
    make
    mecab-ipadic
    mysql
    nginx
    nkf
    openssl
    postgres
    pre-commit
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
    clipy
    dbeaver-community
    docker
    iterm2
    macvim
    meld
    mongodb
    ngrok
    postman
    skitch
    slack
    spotify
    the-unarchiver
)

init_cask_formulas=(
    anaconda
    bettertouchtool
    firefox
    google-chrome
    google-japanese-ime
    homebrew/cask-versions/adoptopenjdk8
    intellij-idea
    karabiner-elements
)

echo "brew tap..."
brew tap caskroom/cask
brew tap heroku/brew

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install "$formula"
    brew upgrade "$formula"
done

echo "start initial brew install cask apps..."
if [ $# -ne 0 ]; then
  if [ "$1" = "init" ]; then
      for formula in "${init_cask_formulas[@]}"; do
          brew cask install "$formula"
          brew cask upgrade "$formula"
      done
  fi
fi

echo "start brew install cask apps..."
for formula in "${cask_formulas[@]}"; do
    brew cask install "$formula"
    brew cask upgrade "$formula"
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
