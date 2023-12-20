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
    go
    gcc
    git
    golangci/tap/golangci-lint
    graphviz
    heroku
    jenkins
    jq
    lnav
    make
    mecab-ipadic
    mysql@5.6
    nginx
    nkf
    openssl
    peco
    postgres
    pre-commit
    protolint
    python3
    rabbitmq
    redis
    remind101/formulae/assume-role
    s3cmd
    shellcheck
    sqlite
    sshrc
    swig
    terraform
    tmux
    tree
    yarn
    wget
    zsh
    zsh-completions
)

cask_formulas=(
    alfred
    appcleaner
    clipy
    cyberduck
    dbeaver-community
    imageoptim
    iterm2
    java
    macvim
    microsoft-teams
    mongodb
    ngrok
    postman
    skitch
    slack
    the-unarchiver
    visual-studio-code
    xmind
    zoom
)

init_cask_formulas=(
    anaconda
    bettertouchtool
    docker
    firefox
    google-chrome
    google-japanese-ime
    homebrew/cask-versions/adoptopenjdk8
    karabiner-elements
    virtualbox
)

echo "brew tap..."
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
          brew install "$formula" --cask
          brew upgrade "$formula" --cask
      done
  fi
fi

echo "start brew install cask apps..."
for formula in "${cask_formulas[@]}"; do
    brew install "$formula" --cask
    brew upgrade "$formula" --cask
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
