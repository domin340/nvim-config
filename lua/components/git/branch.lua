---@class components.git-branch
---@field status { head: string } | nil
local Branch = {
	---@param self components.git-branch
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,

	provider = '󰊢 ',
	{
		---@param self components.git-branch
		provider = function(self)
			return (self.status and self.status.head) or '.undef/'
		end,
	},
}

return Branch
