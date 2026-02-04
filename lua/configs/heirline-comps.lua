local utils = require 'heirline.utils'

local MoveEnd = { provider = '%=' }
local Space = { provider = ' ' }
local At = { provider = '->' }

local lhalf_circle, rhalf_circle = '', ''
-- local function Box(comp, hl)
-- 	return {
-- 		{ hl = { fg = hl.bg }, provider = lhalf_circle },
-- 		{ hl = hl, comp },
-- 		{ hl = { fg = hl.bg }, provider = rhalf_circle },
-- 	}
-- end

local GitBranch = require 'components.git.branch'
local GitChanges = require 'components.git.changes'
local Cursor = require 'components.cursor'
local Ro, Edited = require 'components.files.ro', require 'components.files.edited'
local RelFilePathOrAbs = require 'components.rel-path-or-abs'
local LspDiagnostics = require 'components.lsp-diagnostics'
local FileProgressDesc = require 'components.line-progress-desc'

local GitBranchColored = { hl = { fg = 'kw', bold = true }, GitBranch }
local SurroundedCursor = {
	{ provider = '<' },
	Cursor,
	{ provider = '>' },
}

local ColoredFileProgressDesc = { hl = { fg = 'sym' }, FileProgressDesc }

local Status = {
	utils.insert({ GitBranchColored }, Space, At, Space),
	RelFilePathOrAbs,
	Space,
	GitChanges,

	MoveEnd,

	LspDiagnostics,
	Space,
	SurroundedCursor,
}

local winbar_bg, winbar_fg = 'bgfolded', 'bgnorm'
local Winbar = {
	hl = { bg = winbar_bg },
	{ hl = { fg = winbar_bg, bg = winbar_fg }, provider = lhalf_circle },

	RelFilePathOrAbs,
	Edited,
	Ro,

	MoveEnd,

	ColoredFileProgressDesc,
	{ hl = { fg = winbar_bg, bg = winbar_fg }, provider = rhalf_circle },
}

return {
	winbar = Winbar,
	status = Status,
}
