local conditions = require 'heirline.conditions'

---@param index integer
local function DiagnosticConditionalSpace(index, hl)
	---@class components.lsp-diagnostic-one : components.lsp-diagnostics
	---@field lfindex integer
	local comp = {
		static = { lfindex = index },

		---@param self components.lsp-diagnostic-one
		condition = function(self)
			return self.diag[self.lfindex] > 0
		end,

		hl = hl,

		---@param self components.lsp-diagnostic-one
		provider = function(self)
			return self.icons[self.lfindex] .. self.diag[self.lfindex]
		end,

		{
			---@param self components.lsp-diagnostic-one
			condition = function(self)
				return self.greater_than_zero_after(self.diag, self.lfindex)
			end,

			provider = ' ',
		},
	}

	return comp
end

---@class components.lsp-diagnostics
---@field icons string[]
---@field greater_than_zero_after fun(tbl: table, i: integer)
---@field errors integer
---@field warnings integer
---@field hints integer
---@field info integer
---@field diag integer[]
local LspDiagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		-- error, warning, hint, info
		icons = { ' ', ' ', ' ', ' ' },

		greater_than_zero_after = function(tbl, i)
			local start = i + 1
			if start > #tbl then
				return false
			end

			for j = start, #tbl do
				if tbl[j] > 0 then
					return true
				end
			end

			return false
		end,
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

		self.diag = { self.errors, self.warnings, self.hints, self.info }
	end,

	update = { 'DiagnosticChanged', 'BufEnter' },

	DiagnosticConditionalSpace(1, { fg = 'diag_error' }),
	DiagnosticConditionalSpace(2, { fg = 'diag_warn' }),
	DiagnosticConditionalSpace(3, { fg = 'diag_hint' }),
	DiagnosticConditionalSpace(4, { fg = 'diag_info' }),
}

return LspDiagnostics
