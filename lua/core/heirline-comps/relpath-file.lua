local function this_relpath()
	local filepath = vim.api.nvim_buf_get_name(0)
	return vim.fs.relpath(vim.fn.getcwd(), filepath)
end

--- do not display it when it's current working directory
local function is_not_cwd()
   local relpath = this_relpath()
	return relpath and relpath ~= '.'
end

---@class heirline-comps.relpath-file-display
---@field relpath string | nil relative path from filepath
local RelpathFile = {
	update = { 'BufEnter', 'BufLeave' },

   condition = is_not_cwd,

	---@param self heirline-comps.relpath-file-display
	init = function(self)
		self.relpath = this_relpath()
	end,

	---@param self heirline-comps.relpath-file-display
	provider = function(self)
		return self.relpath
	end,
}

return RelpathFile
