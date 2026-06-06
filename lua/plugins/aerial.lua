return {
	'stevearc/aerial.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('aerial').setup {
			on_attach = function(bufnr)
				vim.keymap.set('n', '{', '<CMD>AerialPrev<CR>', { buf = bufnr, desc = 'aerial go back' })
				vim.keymap.set('n', '}', '<CMD>AerialNext<CR>', { buf = bufnr, desc = 'aerial go forward' })
			end,
		}

		vim.keymap.set('n', '<leader>a', '<CMD>AerialToggle<CR>', { desc = 'toggles aerial' })
	end,
}
