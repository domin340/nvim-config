return {
	'rebelot/heirline.nvim',
	config = function()
		local utils = require 'heirline.utils'

		---@param name string
		local function bg(name)
			return utils.get_highlight(name).bg
		end

		---@param name string
		local function fg(name)
			return utils.get_highlight(name).fg
		end

		local function setup_colors()
			return {
				bgnorm = bg 'Normal',
				bgfolded = bg 'Folded',
				diag_error = fg 'DiagnosticError',
				diag_warn = fg 'DiagnosticWarn',
				diag_hint = fg 'DiagnosticHint',
				diag_info = fg 'DiagnosticInfo',
				fn = fg 'Function',
				ident = fg 'Identifier',
				str = fg 'String',
				kw = fg 'Keyword',
				num = fg 'Number',
				sym = fg '@Symbol',
				darker_blue = '#1f65cf',
				white = '#d4d4d4',
				orange = '#ff5500',
			}
		end

		vim.api.nvim_create_augroup('Heirline', { clear = true })
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				utils.on_colorscheme(setup_colors)
			end,
			group = 'Heirline',
		})

		local comps = require 'configs.heirline-comps'

		require('heirline').setup {
			statusline = comps.status,
		}
	end,
}
