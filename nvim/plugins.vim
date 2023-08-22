
call plug#begin() 
" The default plugin directory will be as follows: 
" "   - Vim (Linux/macOS): '~/.vim/plugged' 
" "   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Any valid git URL is allowed
Plug 'christoomey/vim-tmux-navigator'
Plug 'lambdalisue/suda.vim'
Plug 'f-person/git-blame.nvim'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-abolish'
Plug 'dag/vim-fish'
Plug 'leafgarland/typescript-vim'
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
Plug 'samoshkin/vim-mergetool'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

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

" Personal
Plug '~/aarons_utils'

call plug#end()
