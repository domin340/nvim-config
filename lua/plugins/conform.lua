return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			odinfmt = {
				command = "odinfmt",
				args = { "-stdin" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			odin = { "odinfmt" },
			php = { "php-cs-fixer" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		local map_key = vim.keymap.set

		map_key("n", "<leader>fm", function()
			require("conform").format({
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			})
		end, { desc = "Conform formats the document on a spot" })
	end,
}
