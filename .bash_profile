#!/bin/bash

# rbenv
eval "$(rbenv init -)"
export PATH=$PATH:
export PATH="/usr/local/sbin:$PATH"


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

OTHER=(
  .bash_env_common # 操作PC共通環境変数
  .bash_env_private # 操作PCによって内容の異なる環境変数
  .bash_aliases # 操作PC共通エイリアス
  .bash_aliases_private # 操作PCによって内容の異なるエイリアス
)

for bashfile in "${OTHER[@]}"; do
  if [[ -e "$HOME/$bashfile" ]]; then
    source "$HOME/$bashfile"
  fi
done

# added by Anaconda3 5.2.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

