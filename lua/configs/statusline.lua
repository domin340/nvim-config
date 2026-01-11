local h = require 'core.heirline-comps.h'
local WriteEnd = h.WriteEnd
local Spaced = h.Spaced

local FstatusIcon = require 'core.heirline-comps.fstatus-icon'
local RelpathFile = require 'core.heirline-comps.relpath-file'
local FileModified = require 'core.heirline-comps.file-modified'

local Relpath = {
	FstatusIcon,
	RelpathFile,
	FileModified,
}

-- local GitBranch = require 'core.heirline-comps.git-branch'
-- local GitChanges = require 'core.heirline-comps.git-changes'
-- local Diagnostics = require 'core.heirline-comps.diagnostics'
-- local LspMessage = require 'core.heirline-comps.lsp-list'
local Cursor = require 'core.heirline-comps.cursor'

local Left = {
	Relpath,
}

local Right = Spaced {
	Cursor,
}

return {
	hl = { bg = 'nbg' },

	Left,
	WriteEnd,
	Right,
}

-- [GitBranch] [File] [GitChanges] [%=] [Diagnostics] [LspMessage] [Cursor]
