-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Oil to <leader>e
vim.keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { noremap = false })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { noremap = false })
vim.keymap.set("n", "H", "^", { noremap = false })
