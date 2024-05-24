-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_command("set rtp+=~/.config/nvim")
require("autocmd")
require("plugins")
require("configs")
vim.cmd.source("~/.vimrc")
return vim.cmd.source("~/.config/nvim/vim/init.vim")
