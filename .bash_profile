#!/bin/bash

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

# mysql PATH
if [[ -e "/usr/local/opt/mysql@5.6" ]]; then
    export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# Load anyenv
if which anyenv > /dev/null; then
    eval "$(anyenv init -)"
fi

# added by Anaconda3 2019.03 installer (disabled)
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/usr/local/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/usr/local/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<

# pecoでhistory検索 (zshでのみ実行)
if [ -n "$ZSH_VERSION" ]; then
  function peco-select-history() {
    BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# mysql5.7にパスを通す
# 過去に別バージョンのmysqlがインストールされていた場合は、関連ディレクトリの削除が必要になるかもしれない。
# See: https://qiita.com/AK4747471/items/36b73edd9d1e666ae0c0 
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# GOPATHにPATHを通す
export PATH="$PATH:$(go env GOPATH)/bin"

# nodenvを有効化 (anyenvに含まれるため無効化)
# eval "$(nodenv init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
