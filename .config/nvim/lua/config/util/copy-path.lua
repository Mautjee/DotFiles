local M = {}

M.copy_relative_filepath = function()
  -- Get the full path of the current buffer
  local full_path = vim.fn.expand("%:p")

  -- Get the current working directory (cwd)
  local cwd = vim.fn.getcwd()

  -- Make sure paths use consistent separators
  full_path = string.gsub(full_path, "\\", "/")
  cwd = string.gsub(cwd, "\\", "/")

  -- Ensure cwd has trailing slash
  if string.sub(cwd, -1) ~= "/" then
    cwd = cwd .. "/"
  end

  -- Extract the relative path by removing cwd from the full path
  local relative_path = ""
  if string.find(full_path, cwd, 1, true) == 1 then
    relative_path = string.sub(full_path, string.len(cwd) + 1)
  else
    -- If file is not under cwd, use the filename only
    relative_path = vim.fn.expand("%:t")
  end

  -- Copy the relative path to clipboard
  vim.fn.setreg("+", relative_path)
  vim.fn.setreg('"', relative_path)

  -- Show confirmation message
  vim.notify("Copied to clipboard: " .. relative_path, vim.log.levels.INFO)
end

M.copy_path = function()
  local filename = vim.fn.expand("%")
  vim.fn.setreg("+", filename)
  print("Filename copied to clipboard!")
end

M.copy_file_path_with_content = function()
  local filename = vim.fn.expand("%")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")
  local clipboard_content = filename .. ":\n\n```\n" .. content .. "\n```"
  vim.fn.setreg("+", clipboard_content)
  print("Filename and content copied to clipboard!")
end

return M
