(vim.api.nvim_command "set rtp+=~/.config/nvim")

(require :autocmd)
(require :plugins)
(require :configs)

(vim.cmd.source "~/.vimrc")
(vim.cmd.source "~/.config/nvim/vim/init.vim")
