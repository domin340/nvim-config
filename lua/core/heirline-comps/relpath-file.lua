---@class heirline-comps.relpath-file-icon : heirline-comps.relpaht-file-display
local FileIcon = {
	{
		---@param self heirline-comps.relpath-file-icon
		condition = function(self)
			return not self.readonly
		end,

		hl = { fg = 'sym' },

		---@param self heirline-comps.relpath-file-icon
		provider = function(self)
			return self.file and '󰈔 ' or ' '
		end,
	},
	{
		---@param self heirline-comps.relpath-file-icon
		condition = function(self)
			return self.readonly
		end,

		hl = { fg = 'kw' },

		---@param self heirline-comps.relpath-file-icon
		provider = function(self)
			return self.file and '󰈡 ' or '󰉐 '
		end,
	},
}

---@class heirline-comps.relpaht-file-display
---@field filepath string file path of the current buffer
---@field file boolean whether filepath is a readable file
---@field readonly boolean
local RelpathFileDisplay = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.relpaht-file-display
	init = function(self)
		self.filepath = vim.api.nvim_buf_get_name(0)
		self.file = vim.fn.filereadable(self.filepath) == 1 and true or false
		self.readonly = vim.bo.readonly or not vim.bo.modifiable
	end,

	FileIcon,
	{
		---@param self heirline-comps.relpaht-file-display
		provider = function(self)
			local cwd = vim.fn.getcwd()
			local relpath = vim.fs.relpath(cwd, self.filepath)

			if relpath == '.' then
				return './'
			else
				return relpath
			end
		end,
	},
}

local FileModifiedFlag = {
	condition = function()
		return vim.bo.modified
	end,

	hl = { fg = 'str' },

	provider = '[+]',
}

return {
   RelpathFileDisplay,
   FileModifiedFlag,
}
