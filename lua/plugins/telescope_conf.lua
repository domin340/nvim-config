return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim", -- with telescope extension
		},
		config = function()
			require("telescope").setup()

			-- prerequisites
			local builtin = require("telescope.builtin")
			local map_key = vim.keymap.set

			-- basic key maps
			map_key("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			map_key("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			map_key("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			map_key("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			map_key("n", "<leader>fa", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find all files" })

			-- projects to see all viewed project roots recently opened
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", "package.json" },
			})

			require("telescope").load_extension("projects")
			map_key("n", "<leader>fp", "<CMD>Telescope projects<CR>", { desc = "Telescope Projects" })
		end,
	},
}
