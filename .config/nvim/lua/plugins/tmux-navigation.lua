return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<C-h>","<cmd>TmuxNavigateLeft<cr>", {silent = true})
    vim.keymap.set("n", "<C-l>","<cmd>TmuxNavigateRight<cr>", {silent = true})
    vim.keymap.set("n", "<C-k>","<cmd>TmuxNavigateUp<cr>", {silent = true})
    vim.keymap.set("n", "<C-j>","<cmd>TmuxNavigateDown<cr>", {silent = true})
  end,
}
