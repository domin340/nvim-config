return {
	'rebelot/heirline.nvim',
	config = function()
		require('configs.colors'):setup()

		local statusline = require 'configs.statusline'

		require('heirline').setup {
			statusline = statusline,
		}
	end,
}
