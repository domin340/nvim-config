local capabilities = require('blink.cmp').get_lsp_capabilities()

if vim.lsp.config then
	vim.lsp.config('*', { capabilities = capabilities })
end

vim.lsp.enable({
	'omnisharp',
	'ts_ls',
	'pyright',
	'lua_ls',
	'clangd',
})
