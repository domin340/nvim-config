local h = require 'core.heirline-comps.h'
local Sym = h.Sym

local hl_num = { fg = 'num' }

---displayed: line,column
---@class heirline-comps.cursor-position : heirline-comps.cursor
local Position = {
	{
		hl = hl_num,

		---@param self heirline-comps.cursor-position
		provider = function(self)
			return self.pos[2] -- line
		end,
	},
	Sym ',',
	{
		hl = hl_num,

		---@param self heirline-comps.cursor-position
		provider = function(self)
			return self.pos[3] -- column
		end,
	},
}

---@class heirline-comps.cursor-range : heirline-comps.cursor
---@field vstart integer[]
local Range = {
	---@param self heirline-comps.cursor-range
	init = function(self)
		self.vstart = vim.fn.getpos 'v'
	end,

	{
		hl = hl_num,

		---@param self heirline-comps.cursor-range
		provider = function(self)
			return self.vstart[2] -- visual mode starting line
		end,
	},
	Sym '-',
	{
		hl = hl_num,

		---@param self heirline-comps.cursor-range
		provider = function(self)
			return self.pos[2] -- current line
		end,
	},
}

---displays current cursor position
---
---displayed as: <line,column>
---in visual mode: <line_start-line_end>
---@class heirline-comps.cursor
---@field is_visual_mode fun(self: heirline-comps.cursor): boolean
---@field pos integer[]
---@field mode string
local Cursor = {
	static = {
		---@param self heirline-comps.cursor
		is_visual_mode = function(self)
			local m = self.mode
			return m == 'v' or m == 'V' or m == '\22'
		end,
	},

	---@param self heirline-comps.cursor
	init = function(self)
		self.pos = vim.fn.getpos '.'
		self.mode = vim.fn.mode()
	end,

	Sym '<',
	{
		---@param self heirline-comps.cursor
		condition = function(self)
			return not self:is_visual_mode()
		end,

		Position,
	},
	{
		---@param self heirline-comps.cursor
		condition = function(self)
			return self:is_visual_mode()
		end,

		Range,
	},
	Sym '>',
}

return Cursor
