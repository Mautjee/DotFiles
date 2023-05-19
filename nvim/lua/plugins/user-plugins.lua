return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = {
      defaults = {
        mappings = { "<C-u>", "<C-d>" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
      },
    },
  },
}
