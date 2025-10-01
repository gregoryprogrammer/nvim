-- local lspconfig = require("lspconfig")

--[[
   [ lspconfig.clangd.setup{
   [     on_attach = function(client, bufnr)
   [         client.server_capabilities.signatureHelpProvider = false
   [     end,
   [ }
   ]]

-- lspconfig.pyright.setup({})

--[[
   [ lspconfig.ols.setup {
   [     init_options = {
   [         checker_args = "-strict-style",
   [         enable_semantic_tokens = true,
   [         enable_format = true,
   [     },
   [ }
   ]]

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
