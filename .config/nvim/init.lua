-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_command("set rtp+=~/.config/nvim")
do end (vim.opt.runtimepath):prepend("~/.vim")
vim.cmd.source("~/.config/nvim/configs/coc.vim")
vim.cmd.source("~/.config/nvim/plugins.lua")
vim.cmd.source("~/.vimrc")

require('configs')

vim.cmd.source("~/.config/nvim/keys.vim")
