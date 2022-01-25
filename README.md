# dotfiles

## 基本手順
（順序に間違いある可能性あり、都度修正していくこと）
- homebrewをインストール
	- 参考: https://brew.sh/index_ja
- zpreztoをgit cloneしてインストール
  - https://dev.classmethod.jp/articles/zsh-prezto/
	- シムリンクを作成するところまでで良い。
- bash homebrew_install.shを実行
- bash install.shを実行
- 他、必要に合わせてxxx_install.shをbashで実行していく。

## vscode

vimのextensionによるキーのリピート入力が効かないので、下記コマンドをターミナルで実行する。
その後、vscodeを再起動させて変更を反映させる。

```
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
$ defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
$ defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default
```
