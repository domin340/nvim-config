return {
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
				on_attach = function(bufnr)
					local gitsigns = require('gitsigns')

					local map_key = vim.keymap.set

					---@param tbl table?
					local function opts(tbl)
						tbl = tbl or {}
						tbl.buffer = bufnr
						return tbl
					end

					map_key('n', 'hi', gitsigns.preview_hunk_inline, opts({ desc = 'gitsigns hunk inline' }))
					map_key(
						'n',
						'<leader>tb',
						gitsigns.toggle_current_line_blame,
						opts({ desc = 'gitsigns line blame' })
					)
					map_key('n', '<leader>tw', gitsigns.toggle_word_diff, opts({ desc = 'gitsigns word diff' }))
				end,
			})
		end,
	},
}
