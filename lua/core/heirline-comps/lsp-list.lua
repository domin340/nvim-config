---@class heirline-comp.lsp-list
---@field clients vim.lsp.Client[]
local LspList = {
   update = { 'LspAttach', 'LspDetach', 'BufEnter', 'BufLeave' },

	---@param self heirline-comp.lsp-list
	init = function(self)
		self.clients = vim.lsp.get_clients()
	end,

	---@param self heirline-comp.lsp-list
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
