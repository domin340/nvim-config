local core = require 'core.project'
local capabilities = require('blink.cmp').get_lsp_capabilities()

if vim.lsp.config then
	vim.lsp.config('*', { capabilities = capabilities })
end

local function lua_ls_settings()
	local globals = {}
	local workspace_libraries = {}

	if core.neovim_project() then
		table.insert(globals, 'vim')
		table.insert(workspace_libraries, vim.env.VIMRUNTIME)
	end

	if core.love2d_project() then
		table.insert(globals, 'love')
		-- find types for love2d and include them as well
		-- link with types to transform:
		-- https://github.com/love2d-community/love-api
	end

	return {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				diagnostics = { globals = globals },
				workspace = {
					library = workspace_libraries,
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	}
end

vim.lsp.config('lua_ls', lua_ls_settings())

vim.lsp.enable {
	'omnisharp',
	'ts_ls',
	'pyright',
	'lua_ls',
}
