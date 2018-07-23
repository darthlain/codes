"vimfiler
"let g:vimfiler_enable_auto_cd = 1
"unite ブックマークを開く時vimfilerで開く
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler') 

"vimproc
let g:vimproc#download_windows_dll = 1

"slimv
let g:slimv_swank_cmd ='! xterm -e sbcl --load ~/.cache/dein/repos/github.com/kovisoft/slimv/slime/start-swank.lisp &'

let g:slimv_repl_split = 4
"let g:paredit_mode=1
let g:paredit_electric_return = 0
let g:slimv_leader=","
let g:paredit_leader = ","
let g:slimv_repl_split_size = 10

"solarized
syntax enable
set background=dark

"openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"カラースキーム
colorscheme molokai
hi Comment ctermfg=102
hi Visual  ctermbg=236

"migemo
let g:EasyMotion_use_migemo = 1

if has('win64')
source $VIM/migemo.vim
endif

"quickrun
let g:quickrun_config = {
\'*': {
\'outputter/buffer/split': '5',
\},
\'python': {
\'command': 'python3',
\},
\'tcl': {
\'command': 'wish'
\},
\}

"deoplete 
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
