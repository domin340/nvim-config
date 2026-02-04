local conditions = require 'heirline.conditions'

---@class components.git-changes
---@field status { added?: integer, removed?: integer, changed?: integer }
local Changes = {
   condition = conditions.is_git_repo,

	---@param self components.git-changes
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,

	{
		---@param self components.git-changes
		condition = function(self)
			return self.status.added and self.status.added > 0
		end,

		hl = { fg = 'git_add' },

		---@param self components.git-changes
		provider = function(self)
			return '+' .. self.status.added
		end,
	},
	{
		---@param self components.git-changes
		condition = function(self)
			return self.status.removed and self.status.removed > 0
		end,

		hl = { fg = 'git_del' },

		---@param self components.git-changes
		provider = function(self)
			return '-' .. self.status.removed
		end,
	},
	{
		---@param self components.git-changes
		condition = function(self)
			return self.status.changed and self.status.changed > 0
		end,

		hl = { fg = 'git_change' },

		---@param self components.git-changes
		provider = function(self)
			return '~' .. self.status.changed
		end,
	},
}

return Changes
