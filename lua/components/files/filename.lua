---@class components.filename
---@field name string
local Filename = {
   update = { 'BufEnter', 'BufLeave' },

   ---@param self components.filename
   init = function(self)
      local bufid = vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(bufid)
      self.name = vim.fs.basename(bufname)
   end,

   ---@param self components.filename
   provider = function(self)
      return self.name ~= '' and self.name or 'nothing opened'
   end,
}

return Filename
