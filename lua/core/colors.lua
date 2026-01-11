local utils = require 'heirline.utils'

---returns foreground color
---@param cname string color name
local function fg(cname)
	return utils.get_highlight(cname).fg
end

---returns special color
---@param cname string color name
local function sp(cname)
	return utils.get_highlight(cname).sp
end

---returns background color
---@param cname string color name
local function bg(cname)
	return utils.get_highlight(cname).bg
end

---@class heirline-colors-module
---@field c_clr table? previously cached loaded colors
local M = {}
M.fg = fg
M.bg = bg
M.sp = sp

function M:load_colors()
	if self.c_clr ~= nil then
		return self.c_clr
	end

	local c = {
		str = fg 'String',
		num = fg 'Number',
		sym = fg '@symbol',
      kw = fg 'Keyword',
		nbg = bg 'Normal',
		git_add = fg 'GitSignsAdd',
		git_rm = fg 'GitSignsRemoved',
		git_ch = fg 'GitSignsChanged',
		git_logo = '#f1502f',
      darker_blue = '#1f65cf',
		white = '#d4d4d4',
      gray = '#827d7d'
	}

	self.c_clr = c
	return c
end

function M:setup()
	vim.api.nvim_create_augroup('Heirline', { clear = true })
	vim.api.nvim_create_autocmd('ColorScheme', {
		callback = function()
			utils.on_colorscheme(function()
				return self:load_colors()
			end)
		end,
		group = 'Heirline',
	})
end

return M
