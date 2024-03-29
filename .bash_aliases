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
alias push='git push'
alias ggrep='git grep'
alias glog='git log'
alias fetch='git fetch'
alias co='git checkout'
alias status='git status'
alias add='git add'
alias commit='git commit'

# マージ済みのブランチを全て削除
# see https://gist.github.com/miukoba/fc3c10a25c1c675c1e97
alias delete_local_merged_branch="git branch --merged master | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"
alias remote_prune="git remote prune origin"
alias delete_remote_merged_branch="git branch -r --merged master | grep -v -e master -e develop | sed -e 's% *origin/%%' | xargs -I% git push --delete origin %"

# CLIからVS Codeでファイルを開く
alias edit="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"

# mvimでMacVimが起動するようにする
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"

# Docker
alias dc="docker-compose"

# meld
alias meld="/Applications/Meld.app/Contents/MacOS/Meld"

# swでassume-roleを呼び出し
function sw() {
    eval "$(assume-role -duration 8h $1)"
}
