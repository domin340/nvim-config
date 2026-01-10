local h = require 'core.heirline-comps.h'
local Box = h.Box

---@class heirline-comps.current-lsp
---@field is_any_active fun(self: heirline-comps.current-lsp): boolean
---@field clients vim.lsp.Client[]
local CurrentLsps = {
	static = {
		---@param self heirline-comps.current-lsp
		is_any_active = function(self)
			return #self.clients == 0 or not vim.diagnostic.is_enabled()
		end,
	},

	---@param self heirline-comps.current-lsp
	init = function(self)
		self.clients = vim.lsp.get_clients { bufnr = 0 }
	end,

	update = { 'LspAttach', 'LspDetach' },

	---@param self heirline-comps.current-lsp
	provider = function(self)
		if self:is_any_active() then
			return '@none'
		end

		local lsps_str, concat_str = '', ' '
		for i, value in ipairs(self.clients) do
			lsps_str = lsps_str .. value.name
			if #self.clients > i then
				lsps_str = lsps_str .. concat_str
			end
		end

		return lsps_str
	end,
}

local LspsBox = Box({ bg_clr = 'darker_blue', text_clr = 'white' }, CurrentLsps)

return {
	CurrentLsps = CurrentLsps,
	LspsBox = LspsBox,
}
