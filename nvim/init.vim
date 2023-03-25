set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/coc.vim
source ~/.vimrc
set termguicolors
colorscheme nightfox
" Color scheme (terminal)
" if exists('+termguicolors')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
" endif
" Uncomment this if your theme doesn't have transparency, but you want it to
" hi Normal guibg=NONE ctermbg=NONE

