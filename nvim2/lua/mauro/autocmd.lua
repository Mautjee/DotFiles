local group = vim.api.nvim_create_augroup("OnWritingBuffer", { clear = true })
vim.api.nvim_create_autocmd({ "BufWrite", "BufWritePre" }, {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.format()
  end,
  group = group
})
vim.api.nvim_create_autocmd({ "BufWrite", "BufWritePre" }, {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format()
  end,
  group = group
})
