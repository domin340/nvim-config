---@class heirline-comps.relpaht-file-display
---@field filepath string file path of the current buffer
local RelpathFile = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.relpaht-file-display
	init = function(self)
		self.filepath = vim.api.nvim_buf_get_name(0)
	end,

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
}

return RelpathFile
