---@class heirline-comps.bufnrnote
---@field bufnr number
local BufNum = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.bufnrnote
	init = function(self)
      self.bufnr = vim.api.nvim_get_current_buf()
	end,

	---@param self heirline-comps.bufnrnote
	provider = function(self)
		return '%2(' .. self.bufnr .. '%)'
	end,
}

return {
   hl = { fg = 'fn' },

   { provider = ' '},
   BufNum,
}
