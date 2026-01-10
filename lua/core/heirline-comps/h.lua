local utils = require 'heirline.utils'

local M = {}
M.lhf_circle = ''
M.rhf_circle = ''

M.WriteEnd = { provider = '%=' }
M.Space = { provider = ' ' }

---@param text string
---@param fg_clr string? default is sym
function M.Sym(text, fg_clr)
	return { hl = { fg = fg_clr or 'sym' }, provider = text }
end

function M.Spaced(...)
	local len = select('#', ...)

	local items = {}
	for i = 1, len do
		local selected = select(i, ...)
		if len > i then
			items = utils.insert(items, selected, M.Space)
		else
			items = utils.insert(items, selected)
		end
	end

	return items
end

---@class core.comps-box-opts
---@field text_clr string?
---@field bg_clr string
---@param opts core.comps-box-opts
function M.Box(opts, ...)
	local body = { hl = { bg = opts.bg_clr }, ... }

	if opts.text_clr then
		body.hl.fg = opts.text_clr
	end

	return {
		{ hl = { fg = opts.bg_clr }, provider = M.lhf_circle },
		body,
		{ hl = { fg = opts.bg_clr }, provider = M.rhf_circle },
	}
end

return M
