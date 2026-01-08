return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'master',
	lazy = false,
	build = ':TSUpdate',
	config = {
		ensure_installed = {
			'lua',
			'markdown',
			'markdown_inline',
			'query',
			'vim',
			'vimdoc',
			'c',
			'python',
			'c_sharp',
			'typescript',
			'javascript',
		},
		sync_install = false,
		auto_install = true,
	},
}
