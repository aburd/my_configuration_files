" Leader
let mapleader = " "
let maplocalleader = " "

" Save/quit
noremap <leader>w :q<CR>
noremap <leader>e :Format<CR>
noremap <leader>d :w<CR>
tnoremap <Esc> <C-\><C-n>
imap <tab> <tab>

" Splitpane shortcuts
noremap <leader>v :vsp<CR>
noremap <leader>h :sp<CR>
" Splitpane Size
nnoremap <C-q>h :vertical resize +5<CR>
nnoremap <C-q>l :vertical resize -5<CR>
nnoremap <C-q>j :resize +5<CR>
nnoremap <C-q>k :resize -5<CR>

" Esc
imap jk <Esc>
imap kj <Esc>

" Tabs
noremap <leader>t :tabedit<CR>
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>j :tabprevious<CR>
noremap <leader>k :tabnext<CR>

" Highlighting
noremap <C-m> :noh<CR>

" NERDTree
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
map <leader>r :NERDTreeFind<cr>

"" Fzf
noremap <C-p> :GFiles<CR>
nnoremap <C-u> :Files<CR>
nnoremap <C-i> :Rg<CR>

" Coc
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Jump
nnoremap <Bslash>j :call CocActionAsync('jumpDefinition')<CR>
