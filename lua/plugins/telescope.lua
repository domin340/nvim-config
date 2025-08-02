 return {
   { "nvim-lua/plenary.nvim", lazy = true },
   {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope-file-browser.nvim",
         "nvim-telescope/telescope-ui-select.nvim",
         "ahmedkhalf/project.nvim", -- with telescope extension
      },
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
         map_key("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
         map_key("n", "<leader>fa", function () builtin.find_files({ hidden = true }) end, { desc = "Telescope find all files"})
         map_key("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
         map_key("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
         map_key("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

         -- projects to see all viewed project roots recently opened
         require("project_nvim").setup({
            detection_methods = { "pattern" },
            patterns = { ".git", "package.json", },
         })
         require("telescope").load_extension("projects")

         -- telescope-ui-select
         telescope.load_extension("ui-select")
         map_key("n", "<leader>fp", "<CMD>Telescope projects<CR>", { desc = "Telescope Projects" })

         -- file browser key maps extension
         telescope.load_extension("file_browser")
         map_key(
            "n", "<leader>fr", "<CMD>Telescope file_browser<CR>",
            { desc = "File Browser opens up at project root level" }
         )
         map_key(
            "n", "<leader>fb", "<CMD>Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>",
            { desc = "File Browser opens up at file root level" }
         )
      end
   }
}
