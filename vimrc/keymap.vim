noremap ; :
"禁止
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>
nnoremap , <Nop>
"insert時矢印キーでABCDが入力されてしまう問題の修正
inoremap ^[OD <Left>
inoremap ^[OB <Down>
inoremap ^[OA <Up>
inoremap ^[OC <Right>
"表示上の移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 挿入モード（なんかうまく行かない）
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-b> <Left>
"inoremap <C-l> <Right>
"半分移動
"nnoremap <C-k> <C-u>
"nnoremap <C-j> <C-d>
"一個移動
"nnoremap <S-k> <C-b>
"nnoremap <S-j> <C-f>
"行頭へ
"nnoremap <C-a> 0
"行末へ
"nnoremap <C-e> $
"INSERTからNORMALに戻るときimeoff
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
inoremap <silent><C-c> <C-c>:set iminsert=0<CR>

"カッコ
"inoremap { {}<Left>
"inoremap ( ()<Left>
"noremap! [ []<Left>

"カッコインデント
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>

"easymotion
map <Space> <Plug>(easymotion-s2)

"mapleader
let mapleader="s"
xmap             <Leader>a  <Plug>(EasyAlign)
nmap             <Leader>a  <Plug>(EasyAlign)
nnoremap <silent><Leader>b  :Unite bookmark<CR>
nnoremap <silent><Leader>B  :UniteBookmarkAdd<CR>
nnoremap         <Leader>c  :tabclose<CR>
nnoremap         <Leader>C  :lcd %:h<CR>
nnoremap <silent><Leader>f  :VimFilerBufferDir<CR>
nnoremap <silent><Leader>F  :VimFiler<CR>
nnoremap <silent><Leader>h  :noh<CR>
nnoremap <silent><Leader>i  :VimShellSendString<CR>
nnoremap         <Leader>I  :VimShellInteractive --split='split' 
nnoremap         <Leader>m  :MRU 
nnoremap         <Leader>n  :tabnext<CR>
nnoremap         <Leader>p  :tabprevious<CR>
nnoremap <silent><Leader>q  :call WQuickRun()<CR>
nnoremap <silent><Leader>Q  :QuickRun<CR>
nnoremap <silent><Leader>r  :call Runprogram()<CR>
"nnoremap <silent><Leader>s  :call Vimshellf()<CR>
nnoremap <silent><Leader>s  :VimShallCreate<CR>
nnoremap <silent><Leader>S  :VimShell<CR>
"vmap <silent> .ss :VimShellSendString<CR>
"nnoremap <silent> .ss <S-v>:VimShellSendString<CR>
nnoremap <silent><Leader>t  :tabnew<CR>
nnoremap         <Leader>v  :source %<CR>
nnoremap         <Leader>w  :W3m google 
map      <Leader><Space>    <Plug>(easymotion-s2)

"migemo
if has('unix')
  "nnoremap g/ :Migemo
endif

if has('win64')
  "nnoremap g/ /
  "nnoremap / g/
endif

"fakeclip
"vmap y "*y
"nmap p "*p
