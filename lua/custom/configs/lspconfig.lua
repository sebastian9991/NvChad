local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

--Python
lspconfig.pyright.setup({
  on_attach = on_attach, 
  capabilities = capabilities, 
  filetypes = {"python"}
})



--Typesript/javascrip
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}


--Rust:
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}


---RUST ANALYZER------------------
-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilites = capabilites,
--   filetypes = {"rust"},
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust_analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- })

