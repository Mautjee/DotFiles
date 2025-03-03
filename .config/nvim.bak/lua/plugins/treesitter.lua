return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "markdown", "typescript", "astro", "go", "toml", "json", "yaml" },
			highlight = { enable = true },
			indent = { enebale = true },
		})
	end,
}
