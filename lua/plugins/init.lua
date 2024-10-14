return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "kevinhwang91/promise-async" },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "typescript-language-server",
        "rust-analyzer",
        "vue-language-server",
				"ruff",

        -- formatters
        "prettier",
        "eslint_d",
        "pyright",

        -- defaults
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "stylua",
      },
    },
  },
   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
        -- web
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "vue",
        "json",

        -- other
        "rust",
        "python",
				"dart",

        -- defaults
        "vim",
        "lua",
        "vimdoc"
   		},
   	},
   },
}
