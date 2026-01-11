local h = require 'core.heirline-comps.h'
local WriteEnd = h.WriteEnd
local Spaced = h.Spaced

-- local GitBranch = require 'core.heirline-comps.git-branch'
local RelpathFile = require 'core.heirline-comps.relpath-file'
-- local GitChanges = require 'core.heirline-comps.git-changes'
-- local Diagnostics = require 'core.heirline-comps.diagnostics'
-- local LspMessage = require 'core.heirline-comps.lsp-list'
local Cursor = require 'core.heirline-comps.cursor'

local FrontComponents = {
	RelpathFile,
}

local BackComponents = Spaced {
	Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	WriteEnd,
	BackComponents,
}

-- [GitBranch] [File] [GitChanges] [%=] [Diagnostics] [LspMessage] [Cursor]
