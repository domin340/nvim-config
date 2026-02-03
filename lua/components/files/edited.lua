local Edited = {
	hl = { fg = 'str' },

	condition = function()
		return vim.bo.modified
	end,

	provider = '[+]',
}

return Edited
