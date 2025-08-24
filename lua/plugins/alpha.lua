return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function to_section_val(text)
			assert(type(text) == "string", "to_section_val can only parse strings")
			local nheader = {}
			for s in string.gmatch(text, "[^\n]+") do
				table.insert(nheader, s)
			end
			return nheader
		end

		local function apply_scripting_theme(theme)
			local ascii = [[
      ░█▀▀░█▀▄░█▀▀▄░░▀░░▄▀▀▄░▀█▀░░▀░░█▀▀▄░█▀▀▀░░░░▀█▀░░▀░░█▀▄▀█░█▀▀░░░░░▀░░█▀▀░▄▀░▀▄
      ░▀▀▄░█░░░█▄▄▀░░█▀░█▄▄█░░█░░░█▀░█░▒█░█░▀▄░▄▄░░█░░░█▀░█░▀░█░█▀▀░▄▄░░█▀░▀▀▄░█░░░█
      ░▀▀▀░▀▀▀░▀░▀▀░▀▀▀░█░░░░░▀░░▀▀▀░▀░░▀░▀▀▀▀░▀▀░░▀░░▀▀▀░▀░░▒▀░▀▀▀░▀▀░▀▀▀░▀▀▀░▀▄░▄▀
         ]]

			theme.section.header.val = to_section_val(ascii)
		end

		local theme = require("alpha.themes.dashboard")
		apply_scripting_theme(theme)
		require("alpha").setup(theme.config)
	end,
}
