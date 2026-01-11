local h = require 'core.heirline-comps.h'
local WriteEnd, Spaced = h.WriteEnd, h.Spaced

-- local LspDiagnostics = require 'core.heirline-comps.diagnostics'
-- local LspList = require 'core.heirline-comps.lsp-list'
local GitBranchBox = require 'core.heirline-comps.git-branch-box'
local GitChanges = require 'core.heirline-comps.git-changes'
local Cursor = require 'core.heirline-comps.cursor'
local RelpathFile = require 'core.heirline-comps.relpath-file'
local FileModified = require 'core.heirline-comps.file-modified'
-- local FstatusIcon = require 'core.heirline-comps.fstatus-icon'

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
	Cursor,
}

-- [GitBranch] [File] [GitChanges] [%=] [Diagnostics] [LspMessage] [Cursor]
return {
	hl = { bg = 'nbg' },

	Left,
	WriteEnd,
	Right,
}
