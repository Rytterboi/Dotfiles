local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local function get_sources()
  local sources = {}
  --Check the file type and add sources accordingly
  local filetype = vim.bo.filetype
  if filetype == "javascript" or filetype == "typescript" then
      table.insert(sources, null_ls.builtins.diagnostics.eslint)
      table.insert(sources, null_ls.builtins.formatting.prettier)
  end
  return sources
end

local opts = {
  sources = get_sources(),
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

return opts
