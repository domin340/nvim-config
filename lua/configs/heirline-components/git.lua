local conditions = require 'heirline.conditions'

---@class heirline-comps.git-props
---@field status { head: string, added: number?, removed: number?, changed: number? }

local branch_bg_clr = 'git_logo'

local GitBranch = {
	{ hl = { fg = branch_bg_clr }, provider = '' },
	{
		hl = { bg = branch_bg_clr, fg = 'white' },
		provider = '󰊢 ',
		{
			---@param self heirline-comps.git-props
			provider = function(self)
				return self.status.head
			end,
		},
	},
	{ hl = { fg = branch_bg_clr }, provider = '' },
}

return {
	condition = conditions.is_git_repo,
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.git-props
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,

	GitBranch,
}
