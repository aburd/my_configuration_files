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

"Clipboard  " relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>
" absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>
" filename (foo.txt)
nnoremap <leader>cn :let @+=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>cd :let @+=expand("%:p:h")<CR>

" Esc
imap jk <Esc>
imap kj <Esc>

" Tabs
noremap <leader>t :tabedit<CR>
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>j :tabprevious<CR>
noremap <leader>k :tabnext<CR>
nnoremap <leader>u :tabm -1<CR>
nnoremap <leader>i :tabm +1<CR>
nnoremap ,a 1gt
nnoremap ,s 2gt
nnoremap ,d 3gt
nnoremap ,f 4gt
nnoremap ,g 5gt
nnoremap ,h 6gt
nnoremap <C-t> :Telescope tabs<CR>

" Highlighting
noremap <C-m> :noh<CR>

" Tree
nmap <F6> :NvimTreeToggle<CR>
map <leader><space> :NvimTreeFindFile!<cr>
" nmap <F6> :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1
" map <leader>r :NERDTreeFind<cr>

"" Fzf
noremap <C-p> :Telescope find_files<CR>
nnoremap <C-i> :Telescope live_grep<CR>
nnoremap <C-o> :Telescope buffers<CR>
nnoremap <C-u> :Telescope help_tags<CR>

"" Marks

nnoremap <C-;> :MarksListGlobal<CR>

" Swagger
nnoremap <C-s> :CocCommand swagger.render<CR>

" Coc
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc Typescript
nnoremap <Bslash>t :CocCommand tsserver.chooseVersion<CR>

" Jump
nnoremap <Bslash>j :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Bslash>d :tabonly<CR>

" Git-Blame-Nvim
nnoremap <C-g> :GitBlameToggle<CR>

" Jest
"" Run jest for current file
nnoremap <leader>lf :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

" Run jest for current test
nnoremap <leader>ls :call CocAction('runCommand', 'jest.singleTest')<CR>
