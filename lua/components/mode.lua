---@class components.mode
---@field normalize_mode fun(mode: string): string
---@field modes_tbl { [string]: string }
---@field mode string
---@field full_mode_name string
---@field mode_color string
local Mode = {
   update = 'ModeChanged',

	static = {
		---returns first normalized character for mode
		---@param mode string
		---@return string
		normalize_mode = function(mode)
			if mode == 'no\22' then
				return 'n'
			elseif mode == '\22' or mode == '\22s' then
				return 'V'
			elseif mode == '\19' then
				return 'S'
			else
				return mode
			end
		end,

		modes_tbl = {
			n = { 'NORMAL', 'sym' },
			v = { 'VISUAL', 'fn' },
			V = { 'VBLOCK', 'fn' },
			s = { 'SELECT', 'str' },
			S = { 'BLOCK', 'str' },
			i = { 'INSERT', 'ident' },
			R = { 'REPLACE', 'num' },
			c = { 'COMMAND', 'sym' },
			t = { 'TERM', 'sym' },
			r = { 'PROMPT', 'sym' },
			['!'] = { 'SHELL', 'sym' },
		},
	},

	---@param self components.mode
	init = function(self)
		self.mode = vim.fn.mode()

		local norm = self.normalize_mode(self.mode)
		local mode_conf = self.modes_tbl[norm]

		self.full_mode_name = mode_conf[1]
		self.mode_color = mode_conf[2]
	end,

	---@param self components.mode
	hl = function(self)
		return { fg = self.mode_color, bold = true }
	end,

	---@param self components.mode
	provider = function(self)
		return self.full_mode_name
	end,
}

return Mode
