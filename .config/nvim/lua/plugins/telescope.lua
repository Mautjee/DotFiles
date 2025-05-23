return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = function()
    return {
      pickers = {
        find_files = {
          theme = "ivy",
        },
      },
    }
  end,
}
