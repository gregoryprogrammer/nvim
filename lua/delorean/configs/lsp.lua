local lspconfig = require("lspconfig")

-- TODO clangd diagnostics
--[[
   [ lspconfig.clangd.setup{
   [     on_attach = function(client, bufnr)
   [         client.server_capabilities.signatureHelpProvider = false
   [     end,
   [ }
   ]]

lspconfig.clangd.setup{
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
    end,
}

--[[
   [ require("lspconfig").pyright.setup({
   [   capabilities = capabilities,
   [   handlers = {
   [     ["textDocument/publishDiagnostics"] = function() end,
   [   },
   [ })
   [
   ]]

--[[
   [ vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   [     vim.lsp.diagnostic.on_publish_diagnostics, {
   [         virtual_text = false
   [     }
   [ )
   ]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
