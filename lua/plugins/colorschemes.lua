return {
	-- { 'rktjmp/lush.nvim' },
	-- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	-- { 'wtfox/jellybeans.nvim', name = 'jellybeans-theme', priority = 1000 },
	-- { 'slugbyte/lackluster.nvim', lazy = false, priority = 1000 },
	-- { 'blazkowolf/gruber-darker.nvim' },
	{
		'masisz/wisteria.nvim',
		name = 'wisteria',
		opts = {
			transparent = true,
			overrides = function(_colors)
				return {}
			end,
		},
	},
}
