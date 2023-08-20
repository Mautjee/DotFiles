local status, null_ls = pcall(require, "null-ls")
if not status then
	print("Null-Ls not loaded proparly")
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.code_actions.eslint_d,
	},
	root_dir = require("null-ls.utils").root_pattern(
		".null-ls-root",
		"Makefile",
		".git",
		".prettierrc",
		"eslintrc.json",
		"eslintrc.cjs"
	),
	debug = true,
})
