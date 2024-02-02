local keybindUtils = require("mauro.keymaps.utils")
local bind = vim.keymap.set

-- file explorer
bind("n", "<leader>pp", vim.cmd.Ex, { desc = "Open file explore" })

-- Telescope
bind("n", "<leader>/", keybindUtils.currentBufferFuzzyFind, { desc = "[/] Fuzzily search in current buffer]" })
bind("n", "<leader>cc", require("telescope.builtin").colorscheme, { desc = "change colorschema" })
bind("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

-- For easy move beetween tmux and nvim
bind("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
bind("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
bind("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
bind("n", "<c-j>", "<cmd>TmuxNavigateDow<cr>", { silent = true })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

bind("n", ";a", mark.add_file)
bind("n", ";m", ui.toggle_quick_menu)
bind("n", ";s", keybindUtils.moveNext)
bind("n", ";d", keybindUtils.movePrev)
bind("n", ";q", function() keybindUtils.movePos(1) end)
bind("n", ";w", function() keybindUtils.movePos(2) end)
bind("n", ";e", function() keybindUtils.movePos(3) end)

-- Git (fugitive)
bind("n", "<leader>gs", vim.cmd.Git)

-- Undo tree
bind("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Trigger undo view" })

-- Copy sellection to clipboard
bind({ "n", "v" }, "<leader>Y", [["+y]]);
bind( "n", "<leader>Y", [["+Y]]);
