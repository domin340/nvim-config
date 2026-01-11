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

---inserts space component every second one. e.g.:
---
---```lua
----- { Cursor, Space, BufNrBox }
---local SpacedComponents = Spaced { Cursor, BufNrBox }
---```
---@param t table operant, can be modified, table of components
function M.Spaced(t)
	for i = 1, #t - 1 do
      table.insert(t, i * 2, M.Space)
	end

	return t
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
