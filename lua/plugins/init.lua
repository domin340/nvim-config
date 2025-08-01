return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- configuration
        "vim",
        "vimdoc",
        -- godot
        "gdscript",
        "gdshader",
        "godot_resource",
        -- game dev
        "c_sharp",
        "python",
        "nim",
        -- lua
        "lua",
        "teal",
        "luau",
        -- web
        "html",
        "css",
        "javascript",
        "typescript",
      },
      auto_install = true,
      highlight = { enable = true, },
    },
  },

  {
    "lopi-py/luau-lsp.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    ft = { "lua", "luau" },
    config = function ()
      local function has_rojo(name)
        return string.match(name, ".+%.project%.json")
      end

      local is_rojo_project = vim.fs.root(0, has_rojo)

      require("luau-lsp").setup({
        platform = {
          type = is_rojo_project and "roblox" or "standard"
        }
      })

      if is_rojo_project then
        vim.filetype.add {
          extension = {
            lua = function(path)
              return path:match "%.nvim%.lua$" and "lua" or "luau"
            end,
          },
        }
      end
    end,
  },
}
