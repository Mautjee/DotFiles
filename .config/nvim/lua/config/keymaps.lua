-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Oil to <leader>e
vim.keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { noremap = false })

-- run vim cmd
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { noremap = false })
vim.keymap.set("n", "H", "^", { noremap = false })

-- Quick list
vim.keymap.set("n", "<leader><C-n>", "<cmd>cnext<cr>", { noremap = true })

-- Tmux switching pane
vim.keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })

-- copy relitive path 
vim.keymap.set('n', '<leader>yp', copy_relative_filepath', {noremap = true, silent = true})
