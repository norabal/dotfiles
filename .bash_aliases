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

# マージ済みのブランチを全て削除
# see https://gist.github.com/miukoba/fc3c10a25c1c675c1e97
alias delete_local_merged_branch="git branch --merged master | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"
alias delete_remote_merged_branch="git remote prune origin && git branch -r --merged master | grep -v -e master -e develop | sed -e 's% *origin/%%' | xargs -I% git push --delete origin %"

# CLIからVS Codeでファイルを開く
alias edit="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"

# mvimでMacVimが起動するようにする
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"

# メモを開く
alias memo="conda activate new_day; python ${HOME}/new_day; conda deactivate"

# Docker
alias dc="docker-compose"

# meld
alias meld="/Applications/Meld.app/Contents/MacOS/Meld"
