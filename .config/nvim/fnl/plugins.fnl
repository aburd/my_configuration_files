(local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))

(fn lazy-is-installed? []
  (if ((. (or vim.uv vim.loop) :fs_stat) lazypath)
      true
      false))

(fn install-lazy []
  (vim.fn.system ["git"
                  "clone"
                  "--filter=blob:none"
                  "https://github.com/folke/lazy.nvim.git"
                  "--branch=stable"
                  lazypath]))

(if (not (lazy-is-installed?))
    (install-lazy))

(vim.opt.rtp:prepend lazypath)

(local plugins 
  [:neovim/nvim-lspconfig
   :christoomey/vim-tmux-navigator
   :lambdalisue/suda.vim
   :f-person/git-blame.nvim
   :rust-lang/rust.vim
   {:url "https://github.com/neoclide/coc.nvim"
    :branch "release"}
   {:url "https://github.com/nvim-tree/nvim-tree.lua"
    :version :*
    :lazy false
    :dependencies ["nvim-tree/nvim-web-devicons"] 
    :config (fn []
              ((. (require :nvim-tree) :setup) {:filters {:dotfiles false}}))}
   :stevearc/oil.nvim
   :rcarriga/nvim-notify

   "jasonccox/vim-wayland-clipboard"
   "nvim-treesitter/nvim-treesitter"
   "tpope/vim-surround"
   "tpope/vim-commentary"
   "kdheepak/lazygit.nvim"
   "dag/vim-fish"
   "leafgarland/typescript-vim"
   "tyru/open-browser.vim"
   "aklt/plantuml-syntax"
   "weirongxu/plantuml-previewer.vim"
   "jasonccox/vim-wayland-clipboard"
   "editorconfig/editorconfig-vim"
   "nicwest/vim-camelsnek"
   "samoshkin/vim-mergetool"

   ; Snippets
   {:url "https://github.com/L3MON4D3/LuaSnip"
    :version "v2.*"
    :build "make install_jsregexp"}

   ; find replace
   "nvim-pack/nvim-spectre"

   ; Fuzzy Finder
   "nvim-lua/plenary.nvim"
   "junegunn/fzf"
   "junegunn/fzf.vim"
   {:url "https://github.com/nvim-telescope/telescope.nvim" 
    :tag "0.1.5"}
   {:url "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
    :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}

   "aburd/telescope-tabs" 
   ; {:dir "/home/aburd/code/aburd/telescope-tabs"}
   ; {:dir "/home/aburd/code/aburd/coc-fennel"}
   {:dir "/home/aburd/code/aburd/telescope-yanks"}

   ; Async
   "nvim-neotest/nvim-nio"
        
   ;; Themes
   "flazz/vim-colorschemes"
   "arcticicestudio/nord-vim"
   "EdenEast/nightfox.nvim"
   "vim-airline/vim-airline"
   "vim-airline/vim-airline-themes"

   ;; Marks
   "chentoast/marks.nvim"

   ; fennel
   {:url "https://github.com/Olical/nfnl" 
    :ft "fennel"}

   ; Clojure
   {:url "https://github.com/Olical/conjure"
    :ft ["fennel"]}

   {:url "https://github.com/liquidz/vim-iced"
     :ft ["clojure"]
     :config (fn []
               (tset vim.g :iced_enable_default_key_mappings true)
               (tset vim.g :iced_default_key_mapping_leader "<LocalLeader>"))
     :keys [["<leader>mn" "<cmd>IcedJumpToNextSign<cr>"]
            ["<leader>mN" "<cmd>IcedJumpToPrevSign<cr>"]
            ["<leader>ml" "<cmd>IcedJumpToLet<cr>"]]
     :dependencies [:guns/vim-sexp]}

   {:url "https://github.com/m00qek/baleia.nvim" 
    :tag "v1.4.0"}
   "tpope/vim-dispatch"
   "clojure-vim/vim-jack-in"
   "radenling/vim-dispatch-neovim"
   {:url "https://github.com/eraserhd/parinfer-rust" 
    :build "cargo build --release"}])

((. (require "lazy") "setup") plugins)

