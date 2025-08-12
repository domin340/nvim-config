return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	config = function(_, opts)
		require("bufferline").setup(opts)

		local map_key = vim.keymap.set
		map_key("n", "<leader>n", "<CMD>bnext<CR>", { desc = "go to next buffer" })
		map_key("n", "<leader>p", "<CMD>bprev<CR>", { desc = "go to previous buffer" })
		map_key("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "delete current buffer" })
	end,
}
