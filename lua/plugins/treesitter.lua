return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"typescript",
			"javascript",
			"html",
			"css",
			"vim",
			"vimdoc",
			"lua",
			"markdown",
			"markdown_inline",
			"comment",
			"c",
			"c_sharp",
			"cpp",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			disable = { "odin" },
		},
	},
}
