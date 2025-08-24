if vim.lsp.config then
	local function on_init(client, _)
		if client.supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
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
