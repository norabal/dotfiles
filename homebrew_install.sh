#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

which brew >/dev/null 2>&1 && brew upgrade

formulas=(
    augeas
    autoconf
    awscli
    bash
    bashdb
    certbot
    cookiecutter
    cscope
    ctags
    curl
    curl-ca-bundle
    dialog
    erlang
    fontconfig
    freetype
    gcc
    gd
    gdbm
    gettext
    git
    git-flow
    git-ftp
    git-secrets
    glib
    gmp
    go
    graphviz
    gts
    heroku
    heroku-node
    icu4c
    isl
    jasper
    jenkins
    jpeg
    libevent
    libffi
    libmpc
    libpng
    libssh2
    libtiff
    libtool
    libxml2
    libyaml
    lua
    make
    makedepend
    mecab
    mecab-ipadic
    mongodb
    mpfr
    mysql
    netpbm
    nginx
    nkf
    node
    openssl
    openssl@1.1
    pcre
    pcre2
    perl
    php71
    php71-intl
    php@7.1
    pkg-config
    pv
    pyenv
    python
    python3
    python@2
    qcachegrind
    qt
    qt5
    rabbitmq
    rbenv
    rbenv-gem-rehash
    rbenv-gemset
    readline
    redis
    ruby
    ruby-build
    s3cmd
    shellcheck
    sqlite
    sshrc
    swig
    terraform
    tmux
    tree
    unixodbc
    vim
    webp
    wxmac
    xz
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
