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
			odin = { "odinfmt" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
