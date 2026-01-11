local h = require 'core.heirline-comps.h'
local WriteEnd, Space, Spaced = h.WriteEnd, h.Space, h.Spaced

-- local LspDiagnostics = require 'core.heirline-comps.diagnostics'
-- local LspList = require 'core.heirline-comps.lsp-list'
local GitBranchBox = require 'core.heirline-comps.git-branch-box'
local Cursor = require 'core.heirline-comps.cursor'
local FstatusIcon = require 'core.heirline-comps.fstatus-icon'
local RelpathFile = require 'core.heirline-comps.relpath-file'
local FileModified = require 'core.heirline-comps.file-modified'

local Relpath = {
	FstatusIcon,
	RelpathFile,
   Space,
	FileModified,
}


local Left = Spaced {
   GitBranchBox,
	Relpath,
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
