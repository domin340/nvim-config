return {
	{
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
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"ahmedkhalf/project.nvim", -- with telescope extension
		},
		config = function()
			require("telescope").setup()
			require("telescope").load_extension("ui-select")

			-- see all viewed project roots recently opened
			require("telescope").load_extension("projects")
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", "package.json" },
			})

			-- telescope key maps
			local builtin = require("telescope.builtin")
			local map_key = vim.keymap.set

			map_key("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			map_key("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			map_key("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			map_key("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			map_key("n", "<leader>fa", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find all files" })

			map_key("n", "<leader>fp", "<CMD>Telescope projects<CR>", { desc = "Telescope Projects" })
		end,
	},
}
