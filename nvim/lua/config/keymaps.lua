-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local bind = vim.keymap.set

local function searchFrontend()
  local opt = {}
  opt.cwd = "/Users/mauro/Dev/Kryha/zk-liars-dice/frontend/src"

  require("telescope.builtin").find_files(opt)
end

local function searchBackend()
  local opt = {}
  opt.cwd = "/Users/mauro/Dev/Kryha/zk-liars-dice/backend/src"

  require("telescope.builtin").find_files(opt)
end

bind("n", ";b", searchBackend, { desc = "[S]earch by [G]rep" })
bind("n", ";f", searchFrontend, { desc = "[S]earch by [G]rep" })
bind("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

bind("n", ";a", mark.add_file)
bind("n", ";m", ui.toggle_quick_menu)
bind("n", ";q", function()
  ui.nav_file(1)
end)
bind("n", ";w", function()
  ui.nav_file(2)
end)
bind("n", ";e", function()
  ui.nav_file(3)
end)
bind("n", ";r", function()
  ui.nav_file(4)
end)

-- Inster keybindings
bind("i", "<C-b>", "<ESC>^i", { desc = "beginning of the line" })
bind("i", "<C-e>", "<End>", { desc = "end of the line" })
bind("i", "<C-h>", "<Left>", { desc = "move left" })
bind("i", "<C-l>", "<Right>", { desc = "move right" })
bind("i", "<C-j>", "<Down>", { desc = "move down" })
bind("i", "<C-k>", "<Up>", { desc = "move up" })
bind("n", "<ESC>", "<ESC>", { desc = "enter normal mode" })
