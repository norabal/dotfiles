" MacOSのクリップボードとヤンクを共有
set clipboard+=unnamed

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索対象をハイライト
set hlsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" xやXのときに無名レジスタを上書きさせない
nnoremap x "_x
nnoremap X "_X

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

" molokaiはコメント文字と選択範囲が見づらいので変更
" 参考: http://shocrunch.hatenablog.com/entry/2015/01/15/234555
if &term == "xterm-256color"
    hi Comment ctermfg=102
    hi Visual  ctermbg=236
endif

" JSONビュアーとしてVim(とjq)を使う
" 参考: https://qiita.com/tekkoc/items/324d736f68b0f27680b8
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" \nを改行に置換する
command! Breakn %s/\\n/\r/g
