return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"vim",
			"vimdoc",
			"lua",
			"markdown",
			"markdown_inline",
			"comment",
			"c",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			disable = { "odin" },
		},
	},
}
