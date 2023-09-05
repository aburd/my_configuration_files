vim.api.nvim_command('set rtp+=~/code/aburd/my_configuration_files/nvim/aarons_utils')
vim.api.nvim_command('set rtp+=~/.config/nvim')
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd.source("~/.config/nvim/coc.vim")
vim.cmd.source("~/.config/nvim/plugins.vim")
vim.cmd.source("~/.config/nvim/coc.lua")
vim.cmd.source("~/.vimrc")
vim.cmd.source("~/.config/nvim/keys.vim")

-- configs
vim.cmd.source("~/.config/nvim/configs/fzf.lua")