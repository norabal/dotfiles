# ---------------------------------------------------------------------
# 共通的に使えるエイリアス
# ---------------------------------------------------------------------

# .bash_profile再読込
alias bpro="source ${HOME}/.bash_profile"

# .zshrc再読込
alias zpro="source ${HOME}/.zshrc"

# 既存コマンドの上書き
alias ls="ls -laG"
alias tail="tail -f -n 100"
alias br='git branch'
alias pull='git pull'
alias ggrep='git grep'
alias fetch='git fetch'
alias co='git checkout'
alias status='git status'

# CLIからVS Codeでファイルを開く
alias edit="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"

# メモを開く
alias memo="conda activate new_day; python ${HOME}/new_day; conda deactivate"

# Docker
alias dc="docker-compose"
