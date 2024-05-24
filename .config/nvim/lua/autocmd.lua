-- [nfnl] Compiled from fnl/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
local spacing_100_filetypes = {"*.clj", "*.cljs", "*.cljc"}
local function create_auto_spacing_fn(spacing)
  local function _1_(_ev)
    vim.opt.colorcolumn = tostring(spacing)
    return nil
  end
  return _1_
end
return vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {pattern = spacing_100_filetypes, callback = create_auto_spacing_fn(100)})
