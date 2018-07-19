let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(s:dein_dir)
call dein#add('tomasr/molokai')
call dein#add('yegappan/mru')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('junegunn/vim-easy-align')
call dein#add('thinca/vim-quickrun')
call dein#add('haya14busa/vim-migemo')
call dein#add('itchyny/lightline.vim')
call dein#add('itchyny/vim-parenmatch')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('kana/vim-fakeclip')
call dein#add('kovisoft/slimv')
call dein#add('tyru/open-browser.vim')
call dein#add('yuratomo/w3m.vim')
call dein#add('tpope/vim-surround')
"call dein#add('kana/vim-smartinput')
call dein#add('rhysd/clever-f.vim')
call dein#add('kana/vim-tabpagecd')
call dein#add('katono/rogue.vim')
call dein#add('Vimjas/vim-python-pep8-indent')
call dein#add('gregsexton/VimCalc')
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neco-syntax')
call dein#add('ujihisa/neco-look')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('roxma/nvim-yarp')
call dein#end()

if dein#check_install()
  call dein#install()
endif
