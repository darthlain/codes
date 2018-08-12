set number                " 行番号
set ruler                 " ルーラー
set t_Co=256              " 256色
set backspace=2           " バックスペース設定
set textwidth=0           " 自動改行禁止
set laststatus=2          " ステータスライン常に表示
set cmdheight=2           " コマンドライン二行
set showtabline=2         " 常にタブを表示
set cursorline            " 現在行強調
set gdefault              " :sコマンドで/gオプションをデフォルト
set mouse=a               " マウス操作有効
set winaltkeys=yes        " winキーとaltキーを有効
set completeopt=          " 保管時のプレビューを無効

set vb t_vb=              " ビープ音＆画面フラッシュを消す
set clipboard=unnamed     " クリップボード設定
set wildmode=longest,full " ファイル名補完設定
set ambiwidth=double      " 全角記号の表示がずれる問題への対応
set guicursor=a:blinkon0  " カーソルを点滅させない
set visualbell            " ビジュアルベル
set shellslash            " windowsでファイルの区切り/を有効
set hlsearch              " 検索結果をハイライト
set incsearch             " インクリメンタルサーチ
set ignorecase            " 検索時大文字小文字を無視
set smartcase             " 大文字小文字の含まれる場合は区別
set wrapscan              " 検索を折り返す
" set scrolloff=9999        "タイプライタースクロール
" let loaded_matchparen = 1 "カッコ対応表示ライブラリのmatchparenを無効にする

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
" set timeout timeoutlen=1000 ttimeoutlen=50 "ESCの挙動
set ttimeoutlen=10
set guioptions-=m              " メニューバー設定
set guioptions-=T              " ツールバー設定
set guioptions-=r              " スクロールバー設定
set guioptions-=R
set guioptions-=l
set guioptions-=L
set backupdir=/var/tmp         " バックアップ
set backup
set directory=/var/tmp         " swapファイル
set swapfile
set undodir=/var/tmp           " undoファイル
set undofile
set viminfo=                   " viminfoファイル

set encoding=utf-8             " エンコード設定
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set lispwords-=if              " lispインデント
let g:vim_indent_cont = 0      " vimscriptの継続行のインデント
" set splitbelow            "quickrunなどのタブの開き方
" set splitright

" オムニ補完ができないのを改善?
setlocal omnifunc=syntaxcomplete#Complete

"カッコの色
autocmd ColorScheme * highlight MatchParen ctermfg=White

" 編集中のファイルに合わせてカレントディレクトリを変更(CD.vim)
au   BufEnter *   execute ":lcd " . expand("%:p:h") 

" メニューが無くてもaltspaceのメニューを表示できる WIN限定
if has('gui_running') && (
\   has('win16') || has('win32') ||
\   has('win64') || has('win95'))
    nnoremap <M-Space> :<C-u>simalt ~<CR>
    command! FullScreen :<C-u>simalt ~x<CR>
endif

" vimrcのオートコメント無効
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
