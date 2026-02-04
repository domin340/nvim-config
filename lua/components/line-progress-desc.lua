---e.g.: 10/100  10%
---@class components.file-line-description
---@field curline integer
---@field lines integer
local FileLineDescription = {
	---@param self components.file-line-description
	init = function(self)
		self.curline = vim.fn.getpos('.')[2]
		self.lines = vim.api.nvim_buf_line_count(0)
	end,

   {
      ---@param self components.file-line-description
      provider = function(self)
         return self.curline .. '/' .. self.lines
      end,
   },
   { provider = ' ' },
   {
      ---@param self components.file-line-description
      provider = function(self)
         local line_percent = math.floor((self.curline / self.lines) * 100)
         return line_percent .. '%%'
      end,
   }
}

return FileLineDescription
