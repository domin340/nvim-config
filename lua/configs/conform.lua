local options = {
  formatters = {
    odinfmt = {
      -- Change where to find the command if it isn't in your path.
      command = "odinfmt",
      args = { "-stdin" },
      stdin = true,
    },
  },

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golines" },
    python = { "black" },
    odin = { "odinfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
