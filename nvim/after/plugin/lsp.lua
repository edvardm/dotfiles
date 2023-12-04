local lsp = require('lsp-zero')

lsp.preset("recommended")
-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'sumneko_lua',
-- 	'rust_analyzer'
-- })

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

