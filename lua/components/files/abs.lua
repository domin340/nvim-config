---@class components.absolute-path
---@field path string
local Absolute = {
	---@param self components.absolute-path
	init = function(self)
		self.path = vim.api.nvim_buf_get_name(0)
	end,

	---@param self components.absolute-path
	provider = function(self)
		return self.path ~= '' and self.path or 'nothing opened'
	end,
}

return Absolute
