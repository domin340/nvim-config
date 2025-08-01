require("config.lazy") -- include whole body to use lazy
require("config.keymaps") -- load before calling lazy setup

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- auto update lazy
vim.api.nvim_create_autocmd("VimEnter", {
   callback= function ()
      require("lazy").update({show = false})
   end
})

