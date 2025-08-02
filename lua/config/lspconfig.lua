if vim.lsp.config then
	local capabilities = require("blink.cmp").get_lsp_capabilities()
	vim.lsp.config("*", { capabilities = capabilities })
end

vim.lsp.enable({
	--- scripting
	"emmylua_ls",
	"pyright",

	--- web
	"tl_ls",

	--- backend
	"gopls",

	-- "ols",
	-- "omnisharp",
	-- "clangd",
})
