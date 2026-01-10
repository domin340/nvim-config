local c = require 'core.heirline-comps'

local LspCounterBox = c.Box({ bg_clr = 'darker_blue', text_clr = 'white' }, c.LspActiveCounter)
local BufBox = c.Box({ bg_clr = 'gray', text_clr = 'white' }, c.IconBufNr)

local FrontComponents = {}

local BackComponents = c.Spaced {
	c.GitBranch,
	LspCounterBox,
	BufBox,
	c.Cursor,
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	c.WriteEnd,
	BackComponents,
}
