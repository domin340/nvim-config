local capabilities = require("blink.cmp").get_lsp_capabilities()

if vim.lsp.config then
	vim.lsp.config("*", { capabilities = capabilities })
end

vim.lsp.enable({
	-- "ols",
	-- "pyright",
	"lua_ls",
	"ts_ls",
})
