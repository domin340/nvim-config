if vim.lsp.config then
   local capabilities = vim.lsp.protocol.make_client_capabilities()
   vim.lsp.config("*", { capabilities = capabilities } )
end

vim.lsp.enable({
   --- scripting
   "emmylua_ls",
   "pyright",
   
   --- web
   "tl_ls",
   
   --- backend
   "gopls",

   -- "ols",
   -- "omnisharp",
   -- "clangd",
})

