return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup({})
		vim.keymap.set('n', '<leader>bn', '<CMD>bnext<CR>', { desc = 'go to next buffer' })
		vim.keymap.set('n', '<leader>bp', '<CMD>bprev<CR>', { desc = 'go to previous buffer' })
		vim.keymap.set('n', '<leader>bd', '<CMD>bdelete<CR>', { desc = 'delete current buffer' })
		vim.keymap.set('n', '<leader>btp', '<CMD>BufferLineTogglePin<CR>', { desc = 'pin current buffer' })
	end,
}
