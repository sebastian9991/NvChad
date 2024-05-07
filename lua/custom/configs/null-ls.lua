-- custom/configs/null-ls.lua

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local opts = {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,

    --Lua
    null_ls.builtins.formatting.stylua,

    --cpp
    null_ls.builtins.formatting.clang_format,

    --Python
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

null_ls.setup (opts)

-- Here trying to fix auto formatting for cpp files
-- on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({
--         group = augroup,
--         buffer = bufnr,
--       })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr })
--         end,
--     })
-- end
-- end
local M = {}
M.opts = opts

-- This code is meant to stop conflicts with nvim lsp, and only use null-ls for formatting
M.lsp_formatting = function (bufnr)
      vim.lsp.buf.format({
    filter = function (client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

return M
