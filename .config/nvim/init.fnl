(vim.api.nvim_command "set rtp+=~/.config/nvim")

(vim.opt.runtimepath:prepend "~/.vim")
; (vim.opt.packpath = vim.opt.runtimepath:get())
; (vim.cmd.source "~/.config/nvim/plugins.lua")
(require :plugins)
(require :configs)
(vim.cmd.source "~/.vimrc")
(vim.cmd.source "~/.config/nvim/keys.vim")
