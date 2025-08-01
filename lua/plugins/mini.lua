return {
   "echasnovski/mini.nvim",
   version = "*",
   config = function ()
      local modules = require("config.mini_modules") -- file with all configurations
      -- enable these mini sub modules
      modules:use("mini.pairs", "mini.surround")
   end
}

