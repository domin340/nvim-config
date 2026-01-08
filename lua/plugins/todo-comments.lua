return {
	'folke/todo-comments.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	opts = { signs = true },
	config = function(_, opts)
		require('todo-comments').setup(opts)

		vim.keymap.set('n', 'tl', '<CMD>TodoTelescope<CR>')

		vim.keymap.set('n', 'tn', function()
			require('todo-comments').jump_next()
		end, { desc = 'Todo Comments Next One' })

		vim.keymap.set('n', 'tp', function()
			require('todo-comments').jump_prev()
		end, { desc = 'Todo Comments Previous One' })
	end,
}
