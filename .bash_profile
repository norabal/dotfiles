#!/bin/bash

# mysql PATH
if [[ -e "/usr/local/opt/mysql@5.6" ]]; then
    export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# nodebrew PATH
if [[ -e "$HOME/.nodebrew/current/bin" ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# rbenv PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# anyenv PATH
if [[ -e "$HOME/.anyenv/bin" ]]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# ndenv PATH
if [[ -e "$HOME/.ndenv/bin" ]]; then
    export PATH="$HOME/.ndenv/bin:$PATH"
    eval "$(ndenv init -)"
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

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

