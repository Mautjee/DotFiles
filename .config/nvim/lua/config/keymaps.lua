-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local tel = require("config.telescope.multigrep")
local util = require("config.util.copy-path")

-- Map Oil to <leader>e
vim.keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { noremap = false })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { noremap = false })
vim.keymap.set("n", "H", "^", { noremap = false })

-- Tmux switching pane
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })

-- telescope
vim.keymap.set("n", "<leader>fo", tel.live_multigrep, { noremap = true, desc = "Grep with filter on file extention" })

-- Format json in buffer
vim.keymap.set("n", "<leader>fj", ":%!jq '.'<CR>", { desc = "Format Json" })

-- Copy reletive file path
vim.keymap.set("n", "<leader>yp", util.copy_path, { noremap = true, silent = true, desc = "Copy Relative File Path" })
-- Copy reletive file path and file content
vim.keymap.set(

  "n",
  "<leader>ypf",
  util.copy_file_path_with_content,
  { noremap = true, silent = true, desc = "Copy Relative File Path with file content" }
)
