noremap ; :
nnoremap == 30==
set pastetoggle=<F2>

"禁止
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
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

"INSERTからNORMALに戻るときimeoff
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
inoremap <silent><C-c> <C-c>:set iminsert=0<CR>

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
nnoremap         <Leader>o <Plug>(openbrowser-smart-search)
vnoremap         <Leader>o <Plug>(openbrowser-smart-search)
map      <silent><Leader>p <F2>
nnoremap <silent><Leader>r  :call WQuickRun()<CR>
nnoremap <silent><Leader>r  :QuickRun<CR>
nnoremap <silent><Leader>S  :VimShell<CR>
nnoremap <silent><Leader>t  :tabnew<CR>
nnoremap         <Leader>v  :source %<CR>
nnoremap         <Leader>w  :W3m google 
map      <Leader><Space>    <Plug>(easymotion-s2)
