local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local on_attach = function(client, bufnr)
	-- Formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Fromat", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		require("telescope.builtin").lsp_definitions({ trim_text = true })
	end, opts)
	vim.keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references({ trim_text = true })
	end, opts)
	vim.keymap.set("n", "K", "<Cmd> Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", "<Cmd> Lspsaga diagnostic_jump_next<CR>", opts)

	vim.keymap.set("n", "]d", "<Cmd> Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_patterns = { "package.json", "yarn.lock" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_patterns = { "tailwind.config.js" },
})
nvim_lsp.grammarly.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "markdown", "tex", "text" },
})
