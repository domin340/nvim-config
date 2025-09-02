local capabilities = require("blink.cmp").get_lsp_capabilities()

if vim.lsp.config then
	vim.lsp.config("*", { capabilities = capabilities })
end

---gives all servers provided default capabilities of lsp [`vim.lsp.enable`]
---@param servers string[]
local function lspconfig_enable(servers)
	local lspconfig = require("lspconfig")
	for _, server in pairs(servers) do
		lspconfig[server].setup({ capabilities = capabilities })
	end
end

lspconfig_enable({ "ts_ls" })

vim.lsp.enable({
	"emmylua_ls",
	-- "ols",

	-- "gopls",
	"omnisharp",
	"clangd",
	"pyright",

	-- "intelephense"
	-- "html",
	-- "cssls",
})
