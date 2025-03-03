return {
  "kdheepak/lazygit.nvim",
  config = function()
    vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { noremap = true, silent = true })
  end,
}
