local keybindUtils = require("mauro.keymaps.utils")

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>/", keybindUtils.currentBufferFuzzyFind, "n", desc = "[/] Fuzzily search in current buffer]" },
		{ "<leader>ps", keybindUtils.searchInProject, "n", desc = "[ps] Fuzzily search in project]" },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				colorschemes = {
					enable_preview = true,
				},
			},
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		})
	end,
}
