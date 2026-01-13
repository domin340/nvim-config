return {
	'lopi-py/luau-lsp.nvim',
	config = function()
		local core = require 'core.project'

		require('luau-lsp').setup {
			platform = {
				type = core.rojo_project() and 'roblox' or 'standard',
			},
			types = {
				roblox_security_level = 'PluginSecurity',
			},
			sourcemap = {
				enabled = true,
				autogenerate = true,
				rojo_project_file = 'default.project.json',
				sourcemap_file = 'sourcemap.json',
			},
		}
	end,
}
