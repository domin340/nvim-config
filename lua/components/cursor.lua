---@class components.cursor
---@field col integer
---@field line integer
local Cursor = {
	---@param self components.cursor
	init = function(self)
		local pos = vim.fn.getpos '.'
		self.line, self.col = pos[2], pos[3]
	end,

	update = { 'CursorMoved' },

	{
      hl = { fg = 'num' },

		---@param self components.cursor
		provider = function(self)
			return self.line
		end,
	},
	{ provider = ',' },
	{
      hl = { fg = 'num' },

		---@param self components.cursor
		provider = function(self)
			return self.col
		end,
	},
}

return Cursor
