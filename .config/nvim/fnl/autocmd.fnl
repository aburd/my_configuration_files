(local spacing-100-filetypes ["*.clj" "*.cljs" "*.cljc"])

(fn create-auto-spacing-fn [spacing]
  (fn [_ev]
    (set vim.opt.colorcolumn (tostring spacing))))

(vim.api.nvim_create_autocmd ["BufEnter" "BufWinEnter"]
                             {:pattern spacing-100-filetypes
                              :callback (create-auto-spacing-fn 100)})
