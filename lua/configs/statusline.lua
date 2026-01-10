local utils = require 'heirline.utils'

local Git = require 'configs.heirline-components.git'
local CurrentLsps = require 'configs.heirline-components.cur-lsps'
local Cursor = require 'configs.heirline-components.cursor'
local BufNote = require 'configs.heirline-components.buf-note'

local WriteBack = { provider = '%=' }
local Space = { provider = ' ' }

local function Spaced(...)
	local len = select('#', ...)

	local items = {}
	for i = 1, len do
		local selected = select(i, ...)
		if len > i then
			items = utils.insert(items, selected, Space)
		else
			items = utils.insert(items, selected)
		end
	end

	return items
end

local FrontComponents = {}

local BackComponents = {
	WriteBack,
	Spaced(Git, CurrentLsps, BufNote, Cursor),
}

return {
	hl = { bg = 'nbg' },

	FrontComponents,
	BackComponents,
}
