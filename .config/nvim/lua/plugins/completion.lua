return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
    
		require("nvim-autopairs").setup()

		-- Integrate nvim-autopairs with cmp
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "buffer", max_item_count = 5 }, -- text within current buffer
				{ name = "path", max_item_count = 3 }, -- file system paths
				{ name = "luasnip", max_item_count = 3 }, -- snippets
			}),
			-- Enable pictogram icons for lsp/autocompletion
			formatting = {
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = {
						Copilot = "",
					},
				}),
			},
			experimental = {
				ghost_text = true,
			},
		})
	end,
}
