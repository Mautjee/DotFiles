vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]

require('indent_blankline').setup {
  char = '┊',
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  show_end_of_line = true,
  space_char_blank_line = " ",
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  },
  show_trailing_blankline_indent = false,
  filetype_exclude = { "netrw", "packer", "lspinfo", "help", "man", "checkhealth" },
  bufname_exclude = { "nofile", "terminal" }
}
