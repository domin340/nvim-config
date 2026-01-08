local prettier = { 'prettierd', 'prettier' }

return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			c = { 'clang-format' },
			cpp = { 'clang-format' },

			-- <web stuff>
			javascript = prettier,
			typescript = prettier,
			javascriptreact = prettier,
			typescriptreact = prettier,
			-- </web stuff>

			-- <config files>
			html = prettier,
			json = prettier,
			yaml = prettier,
			-- </config files>
		},
	},
	config = function(_, opts)
		require('conform').setup(opts)

		-- fd, short for: format document
		vim.keymap.set('n', '<leader>fd', function()
			require('conform').format { async = true }
		end, { desc = 'Formats current buffer' })
	end,
}
