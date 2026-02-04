local Slash = { provider = '/' }
local LocalDirIcon = {
   hl = { fg = 'num' },
	provider = ' ',
}

---@class components.rel-file-path.file : components.rel-file-path
---@field icon string
---@field icon_color unknown
local File = {
	---@param self components.rel-file-path.file
	init = function(self)
		local extension = vim.fn.fnamemodify(self.bufname, ':e')
		self.icon, self.icon_color =
			require('nvim-web-devicons').get_icon_color(self.bufname, extension, { default = true })
	end,

	---@param self components.rel-file-path.file
	condition = function(self)
		return self.base ~= ''
	end,

	{
		---@param self components.rel-file-path.file
		provider = function(self)
			return self.icon and (self.icon .. ' ')
		end,

		---@param self components.rel-file-path.file
		hl = function(self)
			return { fg = self.icon_color }
		end,
	},
	{
		---@param self components.rel-file-path.file
		provider = function(self)
			return self.base
		end,
	},
}

local ConditionalDirectory = {
	---@param self components.rel-file-path
	condition = function(self)
		return self.reldir ~= '.'
	end,

	{
		---@param self components.rel-file-path
		provider = function(self)
			return self.reldir
		end,
	},
	Slash,
}

---@class components.rel-file-path
---@field buf integer
---@field bufname string
---@field parent string
---@field reldir string?
---@field base string
local RelativeFilePath = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self components.rel-file-path
	init = function(self)
		self.buf = vim.api.nvim_get_current_buf()
		self.bufname = vim.api.nvim_buf_get_name(self.buf)
		self.parent = vim.fs.dirname(self.bufname)
		self.reldir = vim.fs.relpath(vim.fn.getcwd(), self.parent)
		self.base = vim.fs.basename(self.bufname)
	end,

   hl = { fg = 'sym' },

	LocalDirIcon,
	Slash,
	ConditionalDirectory,
	File,
}

return RelativeFilePath
