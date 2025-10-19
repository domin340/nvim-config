return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"typescript",
			"javascript",
			"vim",
			"vimdoc",
			"lua",
			"markdown",
			"markdown_inline",
			"comment",
			"python",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
}
