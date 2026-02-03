local Ro = require 'components.files.ro'
local Edited = require 'components.files.edited'
local RelativeFilePath = require 'components.files.rel-file-path'

local FilePathWithFlags = {
	{
		update = { 'BufEnter', 'BufLeave' },

		{
			condition = function()
				return vim.bo.buftype == ''
			end,

			RelativeFilePath,
		},
		{
			condition = function()
				return vim.bo.buftype ~= ''
			end,

			hl = { fg = 'sym' },

			provider = function()
				local buf = vim.api.nvim_get_current_buf()
				local bufname = vim.api.nvim_buf_get_name(buf)

				return bufname
			end,
		},
	},

	Edited,
	Ro,
}

return FilePathWithFlags
