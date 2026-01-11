local conditions = require 'heirline.conditions'

---@class heirline-comps.git-changes
---@field status { added: number?, removed: number?, changed: number? }
local Changes = {
	condition = conditions.is_git_repo,

	update = { 'TextChanged', 'TextChangedI', 'BufEnter' },

	---@param self heirline-comps.git-changes
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,

	{
		---@param self heirline-comps.git-changes
		condition = function(self)
			return self.status.added and self.status.added > 0
		end,

		hl = { fg = 'git_add' },

		---@param self heirline-comps.git-changes
		provider = function(self)
			return '+' .. self.status.added
		end,
	},
	{
		---@param self heirline-comps.git-changes
		condition = function(self)
			return self.status.removed and self.status.removed > 0
		end,

		hl = { fg = 'git_rm' },

		---@param self heirline-comps.git-changes
		provider = function(self)
			return '-' .. self.status.removed
		end,
	},
	{
		---@param self heirline-comps.git-changes
		condition = function(self)
			return self.status.changed and self.status.changed > 0
		end,

		hl = { fg = 'git_ch' },

		---@param self heirline-comps.git-changes
		provider = function(self)
			return '~' .. self.status.changed
		end,
	},
}

return Changes
