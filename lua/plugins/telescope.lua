 return {
   { "nvim-lua/plenary.nvim", lazy = true },
   {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
   },
   {
      "nvim-telescope/telescope-ui-select.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
   },
   {  
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function ()
         local telescope = require("telescope")

         local fb_actions = telescope.extensions.file_browser.actions

         telescope.setup({
            extensions = {
               ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
               ["file_browser"] = {
                  --- "ivy": kind of looks like a flat plate put on current buffer
                  --- "dropdown": self-explanatory, looks just like live-grep
                  --- "cursor": mini.files like explorer
                  theme = "dropdown",
                  hijack_netrw = true,
                  mappings = {
                     ["i"] = {
                        ["<C-d>"] = fb_actions.remove,
                        ["<C-r>"] = fb_actions.rename,
                        ["<C-e>"] = fb_actions.create,
                        ["<C-p>"] = fb_actions.goto_parent_dir,
                     }
                  }
               },
            },
         })

         -- prerequisites
         local builtin = require("telescope.builtin")
         local map_key = vim.keymap.set
         
         -- basic key maps
         map_key("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
         map_key("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })
         map_key("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
         map_key("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

         -- telescope-ui-select
         telescope.load_extension("ui-select")

         -- file browser key maps extension
         telescope.load_extension("file_browser")
         map_key("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
      end
   }
}
