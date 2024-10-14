-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"
local servers = {
  cssls = {},
  html = {},
  tailwindcss = {},
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/home/anonymous/.nvm/versions/node/v20.16.0/lib/node_modules/@vue/typescript-plugin",
          languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
        },
      },
    },
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  },
  volar = {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "json" },
  },
  eslint = {},
  rust_analyzer = {},
  dartls = {},
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  },
  ruff = {},
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  if name == "ruff" then
    opts.on_attach = function(client, bufnr)
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end
  else
		opts.on_attach = nvlsp.on_attach
  end

  -- local setup = vim.tbl_deep_extend("force", default_setup, lsp_opts)
  lspconfig[name].setup(opts)
end

require("ufo").setup()

-- Show diagnostics in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = true,
})

