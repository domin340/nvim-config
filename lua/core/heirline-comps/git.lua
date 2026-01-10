local conditions = require 'heirline.conditions'
local h = require 'core.heirline-comps.h'
local Box = h.Box

---@class heirline-comps.git-props
---@field status { head: string, added: number?, removed: number?, changed: number? }

local Branch = {
	condition = conditions.is_git_repo,
	update = { 'BufEnter', 'BufLeave' },

	---@param self heirline-comps.git-props
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
	end,

	Box({ bg_clr = 'git_logo', text_clr = 'white' }, {
		provider = '󰊢 ',
		{
			---@param self heirline-comps.git-props
			provider = function(self)
				return self.status.head
			end,
		},
	}),
}

return {
	Branch = Branch,
}
