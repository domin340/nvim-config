return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = { show_hidden = true },
		})

		local map_key = vim.keymap.set
		map_key("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Oil open parent directory" })
	end,
}
