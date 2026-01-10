local h = require 'core.heirline-comps.h'
local Spaced = h.Spaced
local WriteEnd = h.WriteEnd

local BufNote = require 'core.heirline-comps.buf-note'
local GitBranch = require('core.heirline-comps.git').Branch
local LspsBox = require('core.heirline-comps.cur-lsps').LspsBox
local Cursor = require('core.heirline-comps.cursor').Cursor

local FrontComponents = {}

local BackComponents = Spaced {
	GitBranch,
	LspsBox,
	BufNote,
	Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	WriteEnd,
	BackComponents,
}
