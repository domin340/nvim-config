return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		local mini_conf = require("lua.configs.mini_dot")
		require("mini.surround").setup(mini_conf.surround)
		require("mini.pairs").setup(mini_conf.pairs)
		require("mini.comment").setup(mini_conf.comment)
	end,
}
