local h = require 'core.heirline-comps.h'
local Spaced = h.Spaced
local WriteEnd = h.WriteEnd

local lsps = require 'core.heirline-comps.lsp'
local LspsCounterBox = lsps.CounterBox

local BufNote = require 'core.heirline-comps.buf-note'
local GitBranch = require('core.heirline-comps.git').Branch
local Cursor = require('core.heirline-comps.cursor').Cursor

local FrontComponents = {}

local BackComponents = Spaced {
	GitBranch,
	LspsCounterBox,
	BufNote,
	Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	WriteEnd,
	BackComponents,
}
