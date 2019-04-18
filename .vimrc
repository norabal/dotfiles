" .ideavimから設定読み込み
source ${HOME}/.ideavimrc

" vim-bootstrap.comから生成させた設定(html, javascript, python, rubyを選択)
source ${HOME}/.vim_bootstrap
"source ${HOME}/.vim_bootstrap_nvim (ファイルを開く際にインストールが走るので遅い)

" シンタックスハイライト
"syntax enable

" ファイルタイプの自動検出、ファイルタイプ用のプラグインとインデント設定を自動読み込み
"filetype plugin indent on

" 日本語の文字化け対策（https://qiita.com/meio/items/08143eacd174ac0f7bd5）
"set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
"set fileformats=unix,dos,mac

" 行番号表示
"set number

" カーソルの現在列・行を表示
"set ruler

" 不可視文字の表示
"set list
"set listchars=space:·,nbsp:␣,tab:>-,trail:~,extends:>,precedes:<

" TABキーを押した際にタブ文字の代わりにスペースを入れる
"set expandtab
"set tabstop=2
"set shiftwidth=2

" カーソルのある行を目立つようにする
"set cursorline

" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

" スワップファイルを作らない
set noswapfile

" カラースキーム
"colorscheme elflord

" マウスによるスクロールをON
"set mouse=a

" タイプ途中のコマンドを画面最下行に表示
"set showcmd

" コマンドライン補完を便利に
"set wildmenu

" ステータスラインを常に表示する
"set laststatus=2

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" インサートモードではカーソルはパイプに形を変える
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
