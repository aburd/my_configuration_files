" Leader
let mapleader = " "
let maplocalleader = " "

" Save/quit
noremap <leader>w :q<CR>
noremap <leader>e :Format<CR>
noremap <leader>d :w<CR>
tnoremap <Esc> <C-\><C-n>
imap <tab> <tab>

" Git
noremap <leader>g :LazyGit<CR>

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
nnoremap <leader>m :tabm -1<CR>
nnoremap <leader>, :tabm +1<CR>

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
nnoremap <C-b> :Buffers<CR>
nnoremap <C-s> :CocCommand swagger.render<CR>

" Coc
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Jump
nnoremap <Bslash>j :call CocActionAsync('jumpDefinition')<CR>

" Git-Blame-Nvim
nnoremap <C-g> :GitBlameToggle<CR>

" Jest
"" Run jest for current file
nnoremap <leader>lf :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

" Run jest for current test
nnoremap <leader>ls :call CocAction('runCommand', 'jest.singleTest')<CR>

" Aaron's Utils
nnoremap <Bslash>td :DeleteAllOtherTabs<CR>
