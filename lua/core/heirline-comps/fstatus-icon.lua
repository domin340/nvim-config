---@class heirline-comps.fstatus-icon
---@field readonly boolean
---@field directory boolean
local FileStatusIcon = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.fstatus-icon
	init = function(self)
		local bufname = vim.api.nvim_buf_get_name(0)
		self.directory = vim.fn.isdirectory(bufname) and true or false
		self.readonly = vim.bo.readonly or not vim.bo.modifiable
	end,

	{
      ---@param self heirline-comps.fstatus-icon
		condition = function(self)
			return not self.readonly
		end,

		hl = { fg = 'sym' },

		---@param self heirline-comps.fstatus-icon
		provider = function(self)
			return self.directory and ' ' or '󰈔 '
		end,
	},
	{
		---@param self heirline-comps.fstatus-icon
		condition = function(self)
			return self.readonly
		end,

		hl = { fg = 'kw' },

		---@param self heirline-comps.fstatus-icon
		provider = function(self)
			return self.directory and '󰉐 ' or '󰈡 '
		end,
	},
}

return FileStatusIcon
