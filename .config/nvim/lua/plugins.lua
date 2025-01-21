-- [nfnl] Compiled from fnl/plugins.fnl by https://github.com/Olical/nfnl, do not edit.
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
local function lazy_is_installed_3f()
  if (vim.uv or vim.loop).fs_stat(lazypath) then
    return true
  else
    return false
  end
end
local function install_lazy()
  return vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
if not lazy_is_installed_3f() then
  install_lazy()
else
end
do end (vim.opt.rtp):prepend(lazypath)
local plugins
local function _3_()
  return (require("nvim-tree")).setup({filters = {dotfiles = false}})
end
local function _4_()
  return (require("grug-far")).setup({})
end
local function _5_()
  vim.g["mkdp_filetypes"] = {"markdown"}
  return nil
end
plugins = {"neovim/nvim-lspconfig", "christoomey/vim-tmux-navigator", "lambdalisue/suda.vim", "f-person/git-blame.nvim", "rust-lang/rust.vim", {url = "https://github.com/neoclide/coc.nvim", branch = "release"}, {url = "https://github.com/nvim-tree/nvim-tree.lua", version = "*", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _3_, lazy = false}, "stevearc/oil.nvim", "rcarriga/nvim-notify", {url = "https://github.com/MagicDuck/grug-far.nvim", config = _4_}, {url = "https://github.com/iamcco/markdown-preview.nvim", cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"}, ft = {"markdown"}, build = "cd app && yarn install", init = _5_}, "jasonccox/vim-wayland-clipboard", "nvim-treesitter/nvim-treesitter", "tpope/vim-surround", "tpope/vim-commentary", "kdheepak/lazygit.nvim", "dag/vim-fish", "leafgarland/typescript-vim", "tyru/open-browser.vim", "aklt/plantuml-syntax", "weirongxu/plantuml-previewer.vim", "jasonccox/vim-wayland-clipboard", "editorconfig/editorconfig-vim", "nicwest/vim-camelsnek", "samoshkin/vim-mergetool", {url = "https://github.com/L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp"}, "nvim-pack/nvim-spectre", "nvim-lua/plenary.nvim", "junegunn/fzf", "junegunn/fzf.vim", {url = "https://github.com/nvim-telescope/telescope.nvim", tag = "0.1.5"}, {url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}, "aburd/telescope-tabs", "nvim-neotest/nvim-nio", "flazz/vim-colorschemes", "arcticicestudio/nord-vim", "EdenEast/nightfox.nvim", "vim-airline/vim-airline", "vim-airline/vim-airline-themes", "chentoast/marks.nvim", {url = "https://github.com/Olical/nfnl", ft = "fennel"}, {url = "https://github.com/Olical/conjure", ft = {"fennel"}}, {url = "https://github.com/liquidz/elin", ft = {"clojure"}}, "liquidz/elin-format", {url = "https://github.com/m00qek/baleia.nvim", tag = "v1.4.0"}, "tpope/vim-dispatch", "clojure-vim/vim-jack-in", "radenling/vim-dispatch-neovim", {url = "https://github.com/eraserhd/parinfer-rust", build = "cargo build --release"}, "vim-denops/denops.vim", "lambdalisue/kensaku.vim"}
return (require("lazy")).setup(plugins)
