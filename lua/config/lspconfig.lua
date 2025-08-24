if vim.lsp.config then
	local capabilities = require("blink.cmp").get_lsp_capabilities()
	vim.lsp.config("*", { capabilities = capabilities })
end

vim.lsp.enable({
	"emmylua_ls",
	"ols",

	"gopls",
	-- "clangd",
	-- "pyright",

	-- "intelephense"
	-- "html",
	-- "cssls",
})
