require "nvchad.options"

-- add yours here!
local options = {
  clipboard = "unnamedplus",

  -- Folding
  foldcolumn = "1",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
}

for key, value in pairs(options) do
  vim.o[key] = value
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
