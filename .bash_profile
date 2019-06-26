#!/bin/bash

# mysql PATH
if [[ -e "/usr/local/opt/mysql@5.6" ]]; then
    export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

OTHER=(
  .bash_env_common # 操作PC共通環境変数
  .bash_env_private # 操作PCによって内容の異なる環境変数
  .bash_aliases # 操作PC共通エイリアス
  .bash_aliases_private # 操作PCによって内容の異なるエイリアス
)

# Load anyenv
if which anyenv > /dev/null; then
    eval "$(anyenv init -)"
fi

for bashfile in "${OTHER[@]}"; do
  if [[ -e "$HOME/$bashfile" ]]; then
    source "$HOME/$bashfile"
  fi
done

# TODO anacondaが自動で書き込んでくるので整理が必要
# added by Anaconda3 5.2.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
