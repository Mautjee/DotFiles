return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    pickers = {
      find_files = {
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
    },
    extension = {
      fzf = {},
    },
  },
  config = function()
    require("config.telescope.multigrep").setup()
  end,
}
