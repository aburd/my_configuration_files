-- [nfnl] Compiled from fnl/configs/fzf.fnl by https://github.com/Olical/nfnl, do not edit.
local telescope = require("telescope")
local builtins = require("telescope.builtin")
local themes = require("telescope.themes")
local telescopeConfig = require("telescope.config")
local actions = require("telescope.actions")
local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)}
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
telescope.setup({extensions = {fzf = {fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"}, tabs = {theme = themes.get_ivy()}}, defaults = {vimgrep_arguments = vimgrep_arguments, mappings = {i = {["<C-Down>"] = actions.cycle_history_next, ["<C-Up>"] = actions.cycle_history_prev}}}, pickers = {find_files = {find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"}}, buffers = {sort_lastused = true, mappings = {i = {["<c-d>"] = actions.delete_buffer}}}, colorscheme = {enable_preview = true}}})
telescope.load_extension("fzf")
local function _1_()
  return builtins.colorscheme({})
end
return vim.api.nvim_create_user_command("Colorscheme", _1_, {})
