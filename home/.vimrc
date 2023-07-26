let g:airline_theme='wombat'
colorscheme nightfox

" CoC
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-rust-analyzer', 'coc-solargraph', 'coc-lua', 'coc-jest']

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

" Color scheme (terminal)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Uncomment this if your theme doesn't have transparency, but you want it to
" hi Normal guibg=NONE ctermbg=NONE

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

" Textmate holdouts

" Formatting
" map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL

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
