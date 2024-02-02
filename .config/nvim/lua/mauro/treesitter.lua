local status, configs = pcall(require, "nvim-treesitter.configs");
if (not status) then return end

configs.setup({
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = { "markdown", "json", "css", "lua", "typescript", "rust", "javascript", "tsx" },
    auto_install = true,
})
