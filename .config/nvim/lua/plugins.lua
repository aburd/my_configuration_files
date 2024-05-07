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
  vim.g["iced_enable_default_key_mappings"] = true
  vim.g["iced_default_key_mapping_leader"] = "<LocalLeader>"
  return nil
end
plugins = {"neovim/nvim-lspconfig", "christoomey/vim-tmux-navigator", "lambdalisue/suda.vim", "f-person/git-blame.nvim", "rust-lang/rust.vim", {url = "https://github.com/neoclide/coc.nvim", branch = "release"}, {url = "https://github.com/nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}, config = {filesystem = {filtered_items = {hide_dotfiles = false}}}}, "stevearc/oil.nvim", "rcarriga/nvim-notify", "jasonccox/vim-wayland-clipboard", "nvim-treesitter/nvim-treesitter", "tpope/vim-surround", "tpope/vim-commentary", "kdheepak/lazygit.nvim", "dag/vim-fish", "leafgarland/typescript-vim", "tyru/open-browser.vim", "aklt/plantuml-syntax", "weirongxu/plantuml-previewer.vim", "jasonccox/vim-wayland-clipboard", "editorconfig/editorconfig-vim", "nicwest/vim-camelsnek", "samoshkin/vim-mergetool", "SirVer/ultisnips", "mlaursen/vim-react-snippets", "nvim-pack/nvim-spectre", "nvim-lua/plenary.nvim", "junegunn/fzf", "junegunn/fzf.vim", {url = "nvim-telescope/telescope.nvim", tag = "0.1.5"}, {url = "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}, "aburd/telescope-tabs", "nvim-neotest/nvim-nio", "flazz/vim-colorschemes", "arcticicestudio/nord-vim", "EdenEast/nightfox.nvim", "vim-airline/vim-airline", "vim-airline/vim-airline-themes", "chentoast/marks.nvim", {url = "Olical/nfnl", ft = "fennel"}, {url = "https://github.com/Olical/conjure", ft = {"fennel"}}, {url = "https://github.com/liquidz/vim-iced", ft = {"clojure"}, config = _3_, keys = {{"<leader>mn", "<cmd>IcedJumpToNextSign<cr>"}, {"<leader>mN", "<cmd>IcedJumpToPrevSign<cr>"}, {"<leader>ml", "<cmd>IcedJumpToLet<cr>"}}}, {url = "m00qek/baleia.nvim", tag = "v1.4.0"}, "tpope/vim-dispatch", "clojure-vim/vim-jack-in", "radenling/vim-dispatch-neovim", {url = "eraserhd/parinfer-rust", build = "cargo build --release"}}
return (require("lazy")).setup(plugins)
