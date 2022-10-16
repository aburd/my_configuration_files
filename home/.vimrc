let g:airline_theme='wombat'
let g:CommandTPreferredImplementation='lua'

" Leader
let maplocalleader = ","

" Save/quit
noremap <C-w> :w<CR>
noremap <C-e> :Format<CR>
tnoremap <Esc> <C-\><C-n>
imap <tab> <tab>

" Splitpane shortcuts
noremap <C-T> :vsp<CR>
noremap <C-D> :sp<CR>
noremap <C-L> <C-W>l
noremap <C-K> <C-W>k
noremap <C-J> <C-W>j
noremap <C-H> <C-W>h
" Splitpane Size
nnoremap <C-q>h :vertical resize +5<CR>
nnoremap <C-q>l :vertical resize -5<CR>
nnoremap <C-q>j :resize +5<CR>
nnoremap <C-q>k :resize -5<CR>

" Esc
imap jk <Esc>
imap kj <Esc>

" Tabs
noremap <C-t>e :tabedit<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>


" Highlighting
noremap <C-m> :noh<CR>

" NERDTree
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
map <leader>r :NERDTreeFind<cr>

"" Fzf
nmap <C-p> :GFiles<CR>
nmap <C-i> :Files<CR>

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rust-analyzer']

call plug#begin() 
" The default plugin directory will be as follows: 
" "   - Vim (Linux/macOS): '~/.vim/plugged' 
" "   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Any valid git URL is allowed
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wincent/command-t'
Plug 'dag/vim-fish'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Markdown
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'arcticicestudio/nord-vim'

" Clojure
Plug 'Olical/conjure', { 'tag': 'v4.37.0' }
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'eraserhd/parinfer-rust'

call plug#end()

" Color scheme (terminal)
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
colorscheme nord

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" Sometimes syntax highling can get out of sync in large JSX and TSX files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=0
set linebreak
set wrapmargin=0
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:rustfmt_autosave = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
