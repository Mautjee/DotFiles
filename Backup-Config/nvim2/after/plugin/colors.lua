function ColorMyPencils(color)
  color = color or "dracula"
  -- color = color or "nordic"

  vim.cmd.colorscheme(color)
end

ColorMyPencils()
