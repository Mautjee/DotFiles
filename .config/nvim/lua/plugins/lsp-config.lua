return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
	dependencies = {

		-- Plugin and UI to automatically install LSPs to stdpath
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"hrsh7th/cmp-nvim-lsp",

		-- Install neodev for better nvim configuration and plugin authoring via lsp configurations
		"folke/neodev.nvim",

		-- Progress/Status update for LSP
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
	config = function()
		local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

		require("neodev").setup()

		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "tsserver" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- eslint for javascript and typescript
			},
		})

		-- Override tsserver diagnostics to filter out specific messages
		local messages_to_filter = {}

		local servers = {
			html = {},
			jsonls = {},
			pyright = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enabled = false },
					},
				},
			},
			tailwindcss = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			tsserver = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				settings = {
					experimental = {
						enableProjectDiagnostics = true,
					},
				},
			},
			yamlls = {},
			astro = {},
		}

		-- Default handlers for LSP
		local default_handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		-- nvim-cmp supports additional completion capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local on_attach = function(_client, buffer_number)
			-- TODO: Enable when the keymap file is updated
			-- Pass the current buffer to map lsp keybinds
			map_lsp_keybinds(buffer_number)
		end

		-- Iterate over our servers and set them up
		for name, config in pairs(servers) do
			require("lspconfig")[name].setup({
				capabilities = default_capabilities,
				filetypes = config.filetypes,
				handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
				on_attach = on_attach,
				settings = config.settings,
			})
		end

		-- Configure borderd for LspInfo ui
		require("lspconfig.ui.windows").default_options.border = "rounded"

		-- Configure diagostics border
		vim.diagnostic.config({
			float = {
				border = "rounded",
			},
		})
	end,
}
