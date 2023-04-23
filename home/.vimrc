let g:airline_theme='wombat'
let g:CommandTPreferredImplementation='lua'

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
noremap <C-L> <C-W>l
noremap <C-K> <C-W>k
noremap <C-J> <C-W>j
noremap <C-H> <C-W>h
" Splitpane Size
nnoremap <C-q>h :vertical resize +5<CR>
nnoremap <C-q>l :vertical resize -5<CR>
nnoremap <C-q>j :resize +5<CR>
nnoremap <C-q>k :resize -5<CR>

" Jump
nnoremap <Bslash>j :call CocActionAsync('jumpDefinition')<CR>

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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rust-analyzer', 'coc-solargraph']

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
Plug 'lambdalisue/suda.vim'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jasonccox/vim-wayland-clipboard'
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
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'editorconfig/editorconfig-vim'
Plug 'nicwest/vim-camelsnek'

" Markdown
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'

" Clojure
Plug 'Olical/conjure', { 'tag': 'v4.37.0' }
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'eraserhd/parinfer-rust'

" Node
Plug 'mfussenegger/nvim-dap'
Plug 'mxsdev/nvim-dap-vscode-js'

call plug#end()

<<<<<<< HEAD
=======
" Color scheme (terminal)
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
" colorscheme nord
colorscheme nightfox
" Uncomment this if your theme doesn't have transparency, but you want it to
" hi Normal guibg=NONE ctermbg=NONE

>>>>>>> efe8720 (various)
" Don't try to be vi compatible
set nocompatible

set clipboard+=unnamedplus

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
set cmdheight=1

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
" map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:rustfmt_autosave = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Spellcheck
" Toggle spellchecking
function! ToggleSpellCheck()
  set spelllang=en,cjk
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>S :call ToggleSpellCheck()<CR>
