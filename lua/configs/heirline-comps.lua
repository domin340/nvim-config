--[[
TODO:
* progress (the one in examples)
--]]

local utils = require 'heirline.utils'

local MoveEnd = { provider = '%=' }
local Space = { provider = ' ' }
local Right = { provider = '󰅂' }

local SpacedPointTo = { Space, Right, Space }

local function Box(comp, hl)
	return {
		{ hl = { fg = hl.bg }, provider = '' },
		{ hl = hl, comp },
		{ hl = { fg = hl.bg }, provider = '' },
	}
end

local GitBranch = require 'components.git.branch'
local GitChanges = require 'components.git.changes'
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
	utils.insert(GitBranchBox, SpacedPointTo),
	FilePathWithFlags,
	Space,
	GitChanges,

	MoveEnd,

	LspDiagnostics,
	Space,
	SurroundedCursor,
}

return {
	status = Status,
}
