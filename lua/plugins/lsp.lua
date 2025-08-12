return {
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

		local function on_attach(args)
			---@generic T
			---@param tbl T
			---@return T
			local function opts(tbl)
				tbl.buffer = args.buf
				return tbl
			end

			local map_key = vim.keymap.set
			local buf = vim.lsp.buf

			map_key("n", "gd", buf.definition, opts({ desc = "LSP go to definition" }))
			map_key("n", "gD", buf.declaration, opts({ desc = "LSP go to declaration" }))
			map_key("n", "gt", buf.type_definition, opts({ desc = "LSP go to type definition" }))
			map_key("n", "gh", buf.hover, opts({ desc = "LSP hover" }))

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

		require("config.lspconfig")
	end,
}
