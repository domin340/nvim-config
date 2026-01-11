local h = require 'core.heirline-comps.h'

-- local GitBranch = require 'core.heirline-comps.git-branch'
-- local RelpathFile = require 'core.heirline-comps.relpath-file'
-- local FileMod = require 'core.heirline-comps.file-mod'
-- local GitChanges = require 'core.heirline-comps.git-changes'
-- local LspList = require 'core.heirline-comps.lsp-list'
local Cursor = require 'core.heirline-comps.cursor'

local FrontComponents = {}

local BackComponents = h.Spaced {
   Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	h.WriteEnd,
	BackComponents,
}

-- [Branch] [File] [Dirty/Mod] [Changes] [%=] [LspList] [Cursor]

