-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_command("set rtp+=~/.config/nvim")
do end (vim.opt.runtimepath):prepend("~/.vim")
vim.cmd.source("~/.config/nvim/configs/coc.vim")
vim.cmd.source("~/.config/nvim/plugins.lua")
vim.cmd.source("~/.vimrc")
vim.cmd.source("~/.config/nvim/configs/treesitter.lua")
vim.cmd.source("~/.config/nvim/configs/conjure.vim")
vim.cmd.source("~/.config/nvim/configs/coc.vim")
vim.cmd.source("~/.config/nvim/configs/fzf.lua")
vim.cmd.source("~/.config/nvim/configs/marks.nvim.lua")
vim.cmd.source("~/.config/nvim/configs/spectre.nvim.lua")
vim.cmd.source("~/.config/nvim/configs/oil.lua")
vim.cmd.source("~/.config/nvim/configs/fennel-language-server.nvim.lua")
return vim.cmd.source("~/.config/nvim/keys.vim")
