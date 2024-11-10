(local telescope (require :telescope))
(local builtins (require :telescope.builtin))
(local themes (require :telescope.themes))
(local telescopeConfig (require :telescope.config))
(local actions (require :telescope.actions))

; Clone the default Telescope configuration)
(local vimgrep_arguments [(unpack telescopeConfig.values.vimgrep_arguments)])

(table.insert vimgrep_arguments "--hidden")
(table.insert vimgrep_arguments "--glob")
(table.insert vimgrep_arguments "!**/.git/*")

(telescope.setup
  {:extensions {:fzf {:fuzzy true
                      :override_generic_sorter true
                      :override_file_sorter true
                      :case_mode "smart_case"}
                :tabs {:theme (themes.get_ivy)}
                :yanks {:theme (themes.get_ivy)}}
   :defaults {: vimgrep_arguments}
   :pickers {:find_files {:find_command [:rg :--files :--hidden :--glob "!**/.git/*"]}
             :buffers {:sort_lastused true
                       :mappings {:i {"<c-d>" actions.delete_buffer}}}
             :colorscheme {:enable_preview true}}})

; To get fzf loaded and working with telescope, you need to call)
; load_extension, somewhere after setup function:)
((-> telescope (. :load_extension)) "fzf")
((-> telescope (. :load_extension)) "yanks")

(vim.api.nvim_create_user_command "Colorscheme" (fn [] (builtins.colorscheme {})) {})
