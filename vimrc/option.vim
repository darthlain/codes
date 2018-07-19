"vimrcに書くもの
"set runtimepath+=~/.vimrc
"runtime! *.vim

"行番号
set number
"ルーラー表示
set ruler
"256色表示
set t_Co=256
"ステータスライン常に表示
set laststatus=2
"編集中のファイルに合わせてカレントディレクトリを変更(CD.vim)
au   BufEnter *   execute ":lcd " . expand("%:p:h") 
"バックスペースでインデントや改行を削除できるようにする
set backspace=2
"winキーとaltキーを有効
set winaltkeys=yes
"メニューバー設定
set guioptions-=m
"ツールバー設定
set guioptions-=T
"スクロールバー設定
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"バックアップ
set backupdir=/var/tmp
set backup
"swapファイル
set directory=/var/tmp
set swapfile
"undoファイル
set undodir=/var/tmp
set undofile
"クリップボード設定
set clipboard=unnamed
"バックスペース設定
set backspace=indent,eol,start
"ファイル名補完設定
set wildmode=longest,full
"常にタブを表示
set showtabline=2
"全角記号の表示がずれる問題への対応
set ambiwidth=double
"インデント設定
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
"ctrl-c設定
set timeout timeoutlen=1000 ttimeoutlen=50
"自動改行禁止
set tw=0
"ビープ音＆画面フラッシュを消す
set vb t_vb=
"タイプライタースクロール
"set scrolloff=9999
"カーソルを点滅させない
set guicursor=a:blinkon0
"検索結果をハイライト
set hlsearch
"インクリメンタルサーチ
set incsearch
"検索時大文字小文字を無視
set ignorecase
"大文字小文字の含まれる場合は区別
set smartcase
"コマンドライン二行
set cmdheight=2
"検索を折り返す
set wrapscan
":sコマンドで/gオプションをデフォルト
set gdefault
"マウス操作有効
set mouse=a
"windowsでファイルの区切り/を有効
set shellslash
"カッコの色
autocmd ColorScheme * highlight MatchParen ctermfg=White
"ビジュアルベル
set visualbell
"現在行強調
set cursorline
"保管時のプレビューを無効
set completeopt =
"カッコ対応表示ライブラリのmatchparenを無効にする
"let loaded_matchparen = 1
"vimscriptの継続行のインデント
let g:vim_indent_cont = 0
"永続UNDO
if has('persistent_undo')
  set undodir=~/var/tmp/
  set undofile
endif
"quickrunなどのタブの開き方
set splitbelow
"set splitright
"lisp
let g:lisp_rainbow=1
set lispwords+=
"set lisp
"オムニ補完ができないのを改善?
setlocal omnifunc=syntaxcomplete#Complete
"エンコード設定
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set fileformats=unix,dos,mac

"メニューが無くてもaltspaceのメニューを表示できる WIN限定
if has('gui_running') && (
\   has('win16') || has('win32') ||
\   has('win64') || has('win95'))
    nnoremap <M-Space> :<C-u>simalt ~<CR>
    command! FullScreen :<C-u>simalt ~x<CR>
endif

"vimrcのオートコメント無効
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

"ファイルタイプ
augroup fileTypeIndent
    autocmd!
    au BufEnter *.py  setlocal ts=4 sts=4 sw=4
    au BufEnter *.rb  setlocal ts=2 sts=2 sw=2
    au BufEnter *.c   setlocal ts=4 sts=4 sw=4
    au BufEnter *.h   setlocal ts=4 sts=4 sw=4
    au BufEnter *.cpp setlocal ts=4 sts=4 sw=4
augroup END

"kaoriya設定無効?
"let g:vimrc_local_finish  = 1
"let g:gvimrc_local_finish = 1
