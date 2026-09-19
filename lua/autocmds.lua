require "nvchad.autocmds"

-- Save folds
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    vim.cmd "mkview"
  end,
})

-- Load saved folds
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    vim.cmd "silent! loadview"
  end,
})

