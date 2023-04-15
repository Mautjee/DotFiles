vim.g.mapleader = ' '

local bind = vim.keymap.set

-- File expolre
bind("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open file explore' })

-- Move text
bind("v", "J", ":m '>+3<CR>gv=gv", { desc = 'Move selection 3 lined Down' })
bind("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection 2 lines Up' })

-- Current buffer
bind("n", "<leader>f", vim.lsp.buf.format)

-- For easy move beetween tmux and nvim
bind('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>', { silent = true })
bind('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>', { silent = true })
bind('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>', { silent = true })
bind('n', '<c-j>', '<cmd>TmuxNavigateDow<cr>', { silent = true })

-- Copy selection to clipboard
bind({ "n", "v" }, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])

-- Telescope keymaps
local function findFiles()
  require('telescope.builtin').find_files(
    require("telescope.themes").get_dropdown
    {
      previewer = false,
      hidden = true,
      file_ignore_patterns = {
        ".git",
        "vendor",
        "node_modules"
      }
    }
  )
end

local function currentBufferFuzzyFind()
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    }
  )
end

local function searchFrontend()
  local opt = {}
  opt.cwd = '/Users/mauro/Dev/Kryha/zk-liars-dice/frontend/src'

  require('telescope.builtin').find_files(opt)
end

local function searchBackend()
  local opt = {}
  opt.cwd = '/Users/mauro/Dev/Kryha/zk-liars-dice/backend/src'

  require('telescope.builtin').find_files(opt)
end

bind('n', '<leader>ff', findFiles, { desc = '[F]ind [F]iles' })
bind('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
bind('n', '<leader>/', currentBufferFuzzyFind, { desc = '[/] Fuzzily search in current buffer]' })
bind('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
bind('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
bind('n', ';f', searchFrontend, { desc = '[S]earch by [G]rep' })
bind('n', ';b', searchBackend, { desc = '[S]earch by [G]rep' })
bind('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
bind('n', '<leader>sr', require('telescope.builtin').lsp_references, {})
bind('n', '<leader>sg', require('telescope.builtin').git_status, { desc = '[S]earch [G]it' })

-- Git (fugitive)
bind("n", "<leader>gs", vim.cmd.Git);

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

bind("n", ";a", mark.add_file)
bind("n", "<C-e>", ui.toggle_quick_menu)
bind("n", ";h", function() ui.nav_file(1) end)
bind("n", "<C-t>", function() ui.nav_file(2) end)
bind("n", "<C-n>", function() ui.nav_file(3) end)
bind("n", "<C-s>", function() ui.nav_file(4) end)

-- Defaults to none
bind("n", "Q", "<nop>")
