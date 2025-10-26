require("lua.configs.lazy_body")
require("lua.configs.keymaps")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	install = { colorscheme = { "moonfly" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- auto update lazy
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		require("lazy").update({ show = false })
-- 	end,
-- })

vim.g.background = "dark"
vim.cmd.colorscheme("moonfly")
