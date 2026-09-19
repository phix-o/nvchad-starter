require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  rust_analyzer = {}
}

for name, opts in pairs(servers) do
  if next(opts) ~= nil then
    -- Configure server
    vim.lsp.config(name, opts)
  end

  vim.lsp.enable(name)
end

-- read :h vim.lsp.config for changing options of lsp servers 
