return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
		local map_key = vim.keymap.set
		map_key("n", "<leader>fb", "<CMD>Oil<CR>", { desc = "Oil open parent directory" })
	end,
}
