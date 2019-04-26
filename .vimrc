" vim-bootstrap.comから生成させた設定(html, javascript, python, rubyを選択)
source ${HOME}/.vim_bootstrap
"source ${HOME}/.vim_bootstrap_nvim (ファイルを開く際にインストールが走るので遅い)

" .ideavimから設定読み込み
source ${HOME}/.ideavimrc

" 日本語の文字化け対策（https://qiita.com/meio/items/08143eacd174ac0f7bd5）
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" カーソルのある行を目立つようにする
set cursorline

" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

" スワップファイルを作らない
set noswapfile

" 文字の折返しを行わない
set nowrap

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" インサートモードではカーソルはパイプに形を変える
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" MacVimなどのGUIでファイルを開いた際、自動でNERDTreeが開かないようにする
let g:nerdtree_tabs_open_on_gui_startup = 0
