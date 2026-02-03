-- file dedicated for heirline configuration
--[[
TODO:
* interesting design for filepath with icons e.g.: ( /lua/configs/ heirline-comps.lua)
* is readonly flag e.g.: <orange>[RO]</orange> or <orange> </orange>
* edited flag e.g.: <green>[+]</green>
* lsp diagnostics
* git branch
* git changes
* vim mode e.g.: <x-color>(NORMAL)</x-color>
* lsp attached count e.g.: ( 1 LSP)
* progress (the one in examples)
* cursor e.g.: <line,column>
--]]

local lhalf_circle, rhalf_circle = '', ''
local function Box(comp, hl)
	local box_bg = { fg = hl.bg }

	return {
		{ hl = box_bg, provider = lhalf_circle },
		{ hl = hl, comp },
		{ hl = box_bg, provider = rhalf_circle },
	}
end

local MoveEnd = { provider = '%=' }
local Cursor = require 'components.cursor'
local LspClients = require 'components.lsp-clients'

local RelativeFilePath = require 'components.rel-file-path'
local Edited = require 'components.edited'
local Ro = require 'components.ro'

local Space = { provider = ' ' }

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

local SurroundedCursor = {
	{ provider = '<' },
	Cursor,
	{ provider = '>' },
}

local Status = {
	FilePathWithFlags,

	MoveEnd,

	Box(LspClients, { bg = 'darker_blue', fg = 'white' }),
	Space,
	SurroundedCursor,
}

return {
	status = Status,
}
