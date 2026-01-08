---@return boolean
local function is_neovim_project()
	local conf_dir = vim.fs.normalize(vim.fn.stdpath 'config')
	local cwd = vim.fs.normalize(vim.fn.getcwd())
	return vim.startswith(cwd, conf_dir)
end

---in order to make love2d project distinct from others it checks for 'love2dproject.txt' file.
---if one has this file that means the project is considered love2d project.
---it's important to add that this method here is only to avoid loading unnecessary libraries.
---@return boolean
local function is_love2d_project()
	local file_path = vim.fs.normalize(vim.fn.getcwd() .. '/love2dproject.txt')
	local stat = vim.loop.fs_stat(file_path)
	return stat ~= nil and stat.type == 'file'
end

local capabilities = require('blink.cmp').get_lsp_capabilities()
if vim.lsp.config then
	vim.lsp.config('*', { capabilities = capabilities })
end

local function lua_ls_settings()
	local globals = {}
	local workspace_libraries = {}

	if is_neovim_project() then
		table.insert(globals, 'vim')
		table.insert(workspace_libraries, vim.env.VIMRUNTIME)
	end

	if is_love2d_project() then
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
