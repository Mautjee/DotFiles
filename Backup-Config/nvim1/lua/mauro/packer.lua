local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  -- Install packer

  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { 'MunifTanjim/prettier.nvim' }

  -- Syntax higlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use('norcalli/nvim-colorizer.lua')
  use('karb94/neoscroll.nvim')

  -- Faster navigation
  use('theprimeagen/harpoon')
  use('christoomey/vim-tmux-navigator')

  -- History of files
  use('mbbill/undotree')

  -- Git related
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

  use('nvim-lualine/lualine.nvim') -- Fancier statusline
  use('numToStr/Comment.nvim') -- Better commends
  use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
  use('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically

  -- Color themes
  use("ellisonleao/gruvbox.nvim") -- Color schema
  use("navarasu/onedark.nvim") -- Theme inspired by Atom
  use("AlexvZyl/nordic.nvim") -- Theme Based on North
  use('Mofiqul/dracula.nvim') -- Dracula theme

  -- fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.X', requires = { { 'nvim-lua/plenary.nvim' } } }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)
