---@class heirline-comps.lsp-list
---@field clients vim.lsp.Client[]
local LspList = {
   update = { 'LspAttach', 'LspDetach', 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.lsp-list
	init = function(self)
		self.clients = vim.lsp.get_clients()
	end,

	---@param self heirline-comps.lsp-list
	provider = function(self)
      if #self.clients == 0 then
         return 'no lsp'
      end

		local names = {}
		for _, client in ipairs(self.clients) do
			table.insert(names, client.name)
		end

		return table.concat(names, ' ')
	end,
}

return LspList
