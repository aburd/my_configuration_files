local nvim_lsp = require('lspconfig')
-- nvim_lsp.denols.setup{}

nvim_lsp.denols.setup {
  -- on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  -- on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

vim.g["markdown_fenced_languages"] = {"ts=typescript"}