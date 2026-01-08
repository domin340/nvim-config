return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
      opts = {},
	},
	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
         vim.g.gruvbox_material_background = 'hard'
		end,
	},
}
