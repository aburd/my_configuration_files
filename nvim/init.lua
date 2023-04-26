vim.opt.runtimepath:prepend('~/.vim')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd.source("~/.config/nvim/coc.vim")
vim.cmd.source("~/.config/nvim/plugins.vim")
vim.cmd.source("~/.vimrc")
vim.cmd.source("~/.config/nvim/keys.vim")

