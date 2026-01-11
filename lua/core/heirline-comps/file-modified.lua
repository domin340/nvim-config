return {
	condition = function()
		return vim.bo.modified
	end,

	hl = { fg = 'str' },

	provider = '[+]',
}
