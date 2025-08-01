local manual_lsps = require "configs.manual_lsps"

---@param port? number | string
---@return string lsp name
local function godot_lsp(port)
  port = port or 6005
  local addr = "./godot.pipe"
  local gdscript_config = {
    -- activate it only when dealing project is initialized
    root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
  }
  -- using windows
  if vim.fn.has "win32" == 1 then
    addr = "127.0.0.1:6004"
    gdscript_config["cmd"] = { "ncat", "localhost", tostring(port) }
  end
  vim.lsp.config.gdscript = gdscript_config
  vim.fn.serverstart(addr)
  return "gdscript"
end

-- register servers
require("nvchad.configs.lspconfig").defaults()
for lsp_name, lsp_conf in manual_lsps:list() do
  vim.lsp.config[lsp_name] = lsp_conf
end

-- enable servers
local servers = {
  "emmylua_ls",
  -- godot_lsp(os.getenv "GDScript_Port"),
  -- "teal_ls"
  -- "nim_langserver",

  --[[ python ]]
  -- "flake8",
  -- "pyright",

  --[[ game dev language ]]
  -- "ols",
  "omnisharp",

  --[[ web ]]
  "ts_ls",
  -- "html",
  -- "cssls",
  "gopls",
}

vim.lsp.enable(servers)
-- to configure lsps further read :h vim.lsp.config
