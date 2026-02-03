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

local utils = require 'heirline.utils'
-- local conditions = require 'heirline.conditions'

local MoveEnd = { provider = '%=' }
local Space = { provider = ' ' }
local Right = { provider = '󰅂' }

local function Box(comp, hl)
	local lhalf_circle, rhalf_circle = '', ''
	local box_bg = { fg = hl.bg }

	return {
		{ hl = box_bg, provider = lhalf_circle },
		{ hl = hl, comp },
		{ hl = box_bg, provider = rhalf_circle },
	}
end

local function ConditionalSpace(comp)
	return utils.insert(comp, Space)
end

local GitBranch = require 'components.git.branch'
local Cursor = require 'components.cursor'
local FilePathWithFlags = require 'components.rel-with-flags'
local LspDiagnostics = require 'components.lsp-diagnostics'

local GitBranchBox = Box(GitBranch, { bg = 'orange', fg = 'white' })

local SurroundedCursor = {
	{ provider = '<' },
	Cursor,
	{ provider = '>' },
}

local Status = {
	utils.insert(ConditionalSpace(GitBranchBox), Right, Space),
	FilePathWithFlags,

	MoveEnd,

	LspDiagnostics,
	Space,
	SurroundedCursor,
}

return {
	status = Status,
}
