return {
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("todo-comments").setup({
				signs = false,
			})

			local map_key = vim.keymap.set
			map_key("n", "tl", "<CMD>TodoTelescope<CR>")
			map_key("n", "tn", function()
				require("todo-comments").jump_next()
			end, { desc = "Todo Comments Next One" })
			map_key("n", "tp", function()
				require("todo-comments").jump_prev()
			end, { desc = "Todo Comments Previous One" })
		end,
	},
	{

		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = {
				enabled = true,
				window = { show_documentation = true },
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"nvim-telescope/telescope.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			---@param show_all boolean
			---@return fun(): nil
			local function get_diagnostics(show_all)
				local bufnr = show_all and nil or 0
				return function()
					require("telescope.builtin").diagnostics({ bufnr = bufnr })
				end
			end

			local map_key = vim.keymap.set

			local function on_attach(args)
				---@generic T
				---@param tbl T | { buffer: any }
				---@return T & { buffer: number }
				local function opts(tbl)
					tbl.buffer = args.buf
					return tbl
				end

				local buf = vim.lsp.buf

				map_key("n", "gd", buf.definition, opts({ desc = "LSP go to definition" }))
				map_key("n", "gD", buf.declaration, opts({ desc = "LSP go to declaration" }))
				map_key("n", "gt", buf.type_definition, opts({ desc = "LSP go to type definition" }))
				map_key("n", "gh", buf.hover, opts({ desc = "LSP hover" }))
				map_key("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP opens code actions" })

				map_key("n", "<C-j>", function()
					vim.lsp.util.scroll(4)
				end, opts({ desc = "LSP scroll hover down" }))

				map_key("n", "<C-k>", function()
					vim.lsp.util.scroll(-4)
				end, opts({ desc = "LSP scroll hover up" }))

				map_key("n", "<leader>h", vim.diagnostic.open_float, opts({ desc = "LSP diagnostics floating report" }))
				map_key("n", "<leader>d", get_diagnostics(false), opts({ desc = "LSP View buffer reports" }))
				map_key("n", "<leader>D", get_diagnostics(true), opts({ desc = "LSP View workspace reports" }))
			end

			vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })

			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			require("lua.configs.lspconfig")
		end,
	},
}
