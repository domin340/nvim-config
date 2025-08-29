return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})

		local map_key = vim.keymap.set
		map_key("n", "<leader>n", "<CMD>bnext<CR>", { desc = "go to next buffer" })
		map_key("n", "<leader>p", "<CMD>bprev<CR>", { desc = "go to previous buffer" })
		map_key("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "delete current buffer" })
		map_key("n", "<leader>bp", "<CMD>BufferLineTogglePin<CR>", { desc = "pin current buffer" })
	end,
}
