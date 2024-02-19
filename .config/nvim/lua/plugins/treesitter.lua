return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript", "astro" },
      highlight = { enable = true },
      indent = { enebale = true },
    })
  end,
}
