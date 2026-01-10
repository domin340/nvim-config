---@param text string
local function Symbol(text)
	return { hl = { fg = 'sym' }, provider = text }
end

---@class heirline-comps.cursor-position : heirline-comps.cursor
local Position = {
	{
		hl = { fg = 'num' },

		---@param self heirline-comps.cursor-position
		provider = function(self)
			return self.pos[2]
		end,
	},
	Symbol ';',
	{
		hl = { fg = 'num' },

		---@param self heirline-comps.cursor-position
		provider = function(self)
			return self.pos[3]
		end,
	},
}

---@class heirline-comps.cursor-range : heirline-comps.cursor
---@field vstart integer[] visual selection start
local Range = {
	---@param self heirline-comps.cursor-range
	init = function(self)
		self.vstart = vim.fn.getpos "v"
	end,

	{
		hl = { fg = 'num' },

		---@param self heirline-comps.cursor-range
		provider = function(self)
			return self.vstart[2]
		end,
	},
	Symbol '-',
	{
		hl = { fg = 'num' },

		---@param self heirline-comps.cursor-range
		provider = function(self)
			return self.pos[2]
		end,
	},
}

---@class heirline-comps.cursor
---@field is_visual_mode fun(self: heirline-comps.cursor): boolean
---@field mode string
---@field pos integer[]
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
		self.mode = vim.fn.mode()
		self.pos = vim.fn.getpos '.'
	end,

	Symbol '<',
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
	Symbol '>',
}

return Cursor
