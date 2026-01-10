local h = require 'core.heirline-comps.h'
local Box = h.Box
local Spaced = h.Spaced
local WriteEnd = h.WriteEnd

local LspActiveCounter = require('core.heirline-comps.lsp').ActiveCounter
local IconBufNr = require('core.heirline-comps.bufnr').IconBufNr
local GitBranch = require('core.heirline-comps.git').Branch
local Cursor = require('core.heirline-comps.cursor').Cursor

local LspCounterBox = Box({ bg_clr = 'darker_blue', text_clr = 'white' }, LspActiveCounter)
local BufBox = Box({ bg_clr = 'gray', text_clr = 'white' }, IconBufNr)

local FrontComponents = {}

local BackComponents = Spaced {
	GitBranch,
	LspCounterBox,
	BufBox,
	Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	WriteEnd,
	BackComponents,
}
