local colorschemes = {
   tender = {
      "jacoborus/tender.vim",
      config = function ()
         vim.cmd("colorscheme tender")
      end,
   },
   kanagawa = {
      "rebelot/kanagawa.nvim",
      config = function ()
         -- the best one of them all, imo
         vim.cmd("colorscheme kanagawa-dragon")
      end
   },
   oxocarbon = {
      "nyoom-engineering/oxocarbon.nvim",
      kind = "option",
      light = {
         config = function ()
            vim.opt.background = "light"
            vim.cmd("colorscheme oxocarbon")
         end,
      }, 
      dark = {
         config = function ()
            vim.opt.background = "dark"
            vim.cmd("colorscheme oxocarbon")
         end,
      },
   },
}

return {
   colorschemes = colorschemes,
   dispose_all = function (self)
      self.colorschemes = nil
   end,
   --- @param name string eg. "oxocarbon.dark" which will look for dark theme configuration
   install = function (self, name)
      local new_colorscheme = { lazy = false, priority = 1000, }

      local last_parent = self.colorschemes -- start with root
      -- split on dot sign.
      -- oxocarbon.dark:
      --    1: fragment = "oxocarbon", last_parent = colorschemes
      --    2: fragment = "dark", last_parent = oxocarbon
      for fragment in string.gmatch(name, "[^%.]+") do
         local parent = last_parent[fragment]

         if type(parent[1]) == "string" then
            new_colorscheme[1] = parent[1] -- package name found
         end

         if type(parent.name) == "string" then
            new_colorscheme.name = parent.name
         end

         if parent.kind ~= "option" then
            -- reached last child
            new_colorscheme.config = parent.config
            new_colorscheme.opts = parent.opts
            break
         end

         last_parent = parent
      end

      assert(new_colorscheme[1] ~= nil, "given scheme name is invalid, nothing was found")
      assert(new_colorscheme.opts ~= nil or new_colorscheme.config ~= nil, "no subscheme found")

      return new_colorscheme
   end
}

