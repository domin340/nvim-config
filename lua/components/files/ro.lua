local Ro = {
	update = { 'BufEnter', 'BufLeave' },

	condition = function()
		return not vim.bo.modifiable or vim.bo.readonly
	end,

	hl = { fg = 'kw' },

	provider = ' ',
}

return Ro
