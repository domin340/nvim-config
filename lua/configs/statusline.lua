local h = require 'core.heirline-comps.h'
local WriteEnd, Box, Spaced = h.WriteEnd, h.Box, h.Spaced

-- local LspDiagnostics = require 'core.heirline-comps.diagnostics'
local GitBranchBox = require 'core.heirline-comps.git-branch-box'
local GitChanges = require 'core.heirline-comps.git-changes'
local Cursor = require 'core.heirline-comps.cursor'
local RelpathFile = require 'core.heirline-comps.relpath-file'
local FileModified = require 'core.heirline-comps.file-modified'
-- local FstatusIcon = require 'core.heirline-comps.fstatus-icon'

local LspList = require 'core.heirline-comps.lsp-list'
local LspListBox = Box({ bg_clr = 'darker_blue', text_clr = 'white' }, LspList)

local Relpath = {
	-- FstatusIcon,
	RelpathFile,
	FileModified,
}

local Left = Spaced {
	GitBranchBox,
	Relpath,
	GitChanges,
}

local Right = Spaced {
	LspListBox,
	Cursor,
}

-- [GitBranch] [File] [GitChanges] [%=] [Diagnostics] [LspMessage] [Cursor]
return {
	hl = { bg = 'nbg' },

	Left,
	WriteEnd,
	Right,
}
