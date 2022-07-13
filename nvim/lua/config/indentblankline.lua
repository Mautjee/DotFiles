local M = {}

function M.setup()
  local g = vim.g
	show_end_of_line = true
  g.indent_blankline_show_end_of_line = true
  g.indent_blankline_char = "┊"
  g.indent_blankline_filetype_exclude = { "help", "packer" }
  g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  g.indent_blankline_show_trailing_blankline_indent = false
end

return M
