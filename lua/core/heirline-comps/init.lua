local h = require 'core.heirline-comps.h'
local git = require 'core.heirline-comps.git'
local bufnr = require 'core.heirline-comps.bufnr'
local cursor = require 'core.heirline-comps.cursor'
local lsp = require 'core.heirline-comps.lsp'

-- TODO: method that checks if all components were enlisted. A component:
--       * can be a function
--       * can have a property 'provider'
--       * be a table of tables
--       if one property is missing inside table or does not meet the requirements,
--       method calls error

---errors, if component is invalid or missing from list of components list
---@param t table
---@param expected table[]
local function validate_components(t, expected) end

local all_components = {
	-- <helper components>
	Spaced = h.Spaced,
	Space = h.Space,
	WriteEnd = h.WriteEnd,
	Sym = h.Sym,
	Box = h.Box,
	-- </helper components>

	-- <lsp components>
	LspActiveCounter = lsp.ActiveCounter,
	LspList = lsp.List,
	-- </lsp components>

	-- <cursor components>
	Cursor = cursor.Cursor,
	CursorPosition = cursor.Position,
	CursorRange = cursor.Range,
	-- </cursor components>

	-- <bufnr components>
	BufNr = bufnr.BufNr,
	IconBufNr = bufnr.IconBufNr,
	-- </bufnr components>

	-- <git components>
	GitBranch = git.Branch,
	-- </git components>
}

-- required for huge components lists to avoid missing components during development
validate_components(all_components, { h, git, bufnr, cursor, lsp })

return all_components
