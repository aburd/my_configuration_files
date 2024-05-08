-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_command("set rtp+=~/.config/nvim")
require("plugins")
require("configs")
vim.cmd.source("~/.vimrc")
vim.cmd.source("~/.config/nvim/vim/configs/luasnip.vim")
return vim.cmd.source("~/.config/nvim/vim/keys.vim")
