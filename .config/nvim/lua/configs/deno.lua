local nvim_lsp = require('lspconfig')
-- nvim_lsp.denols.setup{}

nvim_lsp.denols.setup {
  -- on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

vim.g["markdown_fenced_languages"] = {"ts=typescript"}
