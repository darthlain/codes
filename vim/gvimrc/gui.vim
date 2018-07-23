"２バイト文字
set ambiwidth=double

"Colorscheme
colorscheme molokai

"solarized
"syntax enable
"set background=dark

"Visualbell
set visualbell t_vb=
"タブ
set showtabline=2
"メニューバーを非表示にする
"set guioptions-=m
"ツールバーを非表示にする
set guioptions-=T

"メニューの文字化けに対応
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim



"OS別

if has('unix')
set gfn=Ricty\ Diminished\ Bold\ 14 " 文字設定
endif

if has('win64')
set gfn=Ricty_Diminished:h14:b:cSHIFTJIS " 文字設定
"autocmd GUIEnter * set transparency=230  " 透明化 危険
endif
