return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      border = "rounded",
      sources = {

        -- Formatting
        formatting.stylua,
        formatting.prettierd,

        -- completion
        completion.spell,
      },
    })
  end,
}
