return {
	'folke/todo-comments.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
   opts = { signs = true },
	config = function(_, opts)
		require('todo-comments').setup(opts)

		local map_key = vim.keymap.set
		map_key('n', 'tl', '<CMD>TodoTelescope<CR>')

		map_key('n', 'tn', function()
			require('todo-comments').jump_next()
		end, { desc = 'Todo Comments Next One' })

		map_key('n', 'tp', function()
			require('todo-comments').jump_prev()
		end, { desc = 'Todo Comments Previous One' })
	end,
}
