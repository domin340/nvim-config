---@class components.lsp-clients
---@field clients vim.lsp.Client[]
local LspClients = {
	---@param self components.lsp-clients
	init = function(self)
		self.clients = vim.lsp.get_clients { bufnr = 0 }
	end,

   update = { 'LspAttach' },

	---@param self components.lsp-clients
	provider = function(self)
		local count = #self.clients
		return count .. ' ' .. (count == 1 and 'client' or 'clients')
	end,
}

return LspClients
