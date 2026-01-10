---pasting it to update properties makes the component update every possible time
---lsp counter for buffer could possibly change.
local clients_update = { 'LspAttach', 'LspDetach', 'BufEnter', 'BufLeave' }

---@class heirline-comps.lsps-list
---@field is_any_active fun(self: heirline-comps.lsps-list): boolean
---@field clients vim.lsp.Client[]
local List = {
	static = {
		---@param self heirline-comps.lsps-list
		is_any_active = function(self)
			return #self.clients == 0 or not vim.diagnostic.is_enabled()
		end,
	},

	---@param self heirline-comps.lsps-list
	init = function(self)
		self.clients = vim.lsp.get_clients { bufnr = 0 }
	end,

	update = clients_update,

	---@param self heirline-comps.lsps-list
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

---@class heirline-comps.is-active
---@field clients vim.lsp.Client[]
local ActiveCounter = {
	---@param self heirline-comps.is-active
	init = function(self)
		self.clients = vim.lsp.get_clients { bufnr = 0 }
	end,

	update = clients_update,

	---@param self heirline-comps.is-active
	provider = function(self)
		local count = #self.clients

		if count == 0 then
			return 'no clients'
		elseif count == 1 then
			return '1 client'
		else
			return count .. ' clients'
		end
	end,
}

return {
	List = List,
	ActiveCounter = ActiveCounter,
}
