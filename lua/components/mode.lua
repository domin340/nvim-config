---@class components.mode
---@field mode_names table
---@field mode_colors table
---@field mode string
local Mode = {
	static = {
		mode_names = {
			n = 'N',
			no = 'N?',
			nov = 'N?',
			noV = 'N?',
			['no\22'] = 'N?',
			niI = 'Ni',
			niR = 'Nr',
			niV = 'Nv',
			nt = 'Nt',
			v = 'V',
			vs = 'Vs',
			V = 'V_',
			Vs = 'Vs',
			['\22'] = '^V',
			['\22s'] = '^V',
			s = 'S',
			S = 'S_',
			['\19'] = '^S',
			i = 'I',
			ic = 'Ic',
			ix = 'Ix',
			R = 'R',
			Rc = 'Rc',
			Rx = 'Rx',
			Rv = 'Rv',
			Rvc = 'Rv',
			Rvx = 'Rv',
			c = 'C',
			cv = 'Ex',
			r = '...',
			rm = 'M',
			['r?'] = '?',
			['!'] = '!',
			t = 'T',
		},
		mode_colors = {
			n = 'kw',
			i = 'ident',
			v = 'fn',
			V = 'fn',
			['\22'] = 'fn',
			c = 'num',
			s = 'str',
			S = 'str',
			['\19'] = 'str',
			R = 'num',
			r = 'num',
			['!'] = 'kw',
         t = 'kw',
		},
	},

	---@param self components.mode
	init = function(self)
		self.mode = self.mode_names[vim.fn.mode()]
	end,

	---@param self components.mode
	hl = function(self)
		local m = self.mode:sub(1, 1)
		return { fg = self.mode_colors[m], bold = true }
	end,

	---@param self components.mode
	provider = function(self)
		return '%-2(' .. self.mode .. '%)'
	end,
}

return Mode
