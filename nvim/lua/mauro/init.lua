local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- setting up Neovim
require("mauro.options")

-- Installing plugins
require("lazy").setup("mauro.plugins")

-- Setting up keymaps
require("mauro.keymaps")

-- Setting up the colorscheme
require("mauro.colors");

-- Setting up TreeSitter
require("mauro.treesitter")

-- Setting up the LSP and CMD with Mason
require("mauro.lsp")
