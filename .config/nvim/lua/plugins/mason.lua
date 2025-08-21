return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                width = 0.9,
                border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = "MasonToolsInstall",
        config = function()
            local ensure_installed = {
                -- C/C++
                "clangd",
                "cpplint",
                "clang-format",

                -- Lua
                "stylua",
                "lua-language-server",

                -- Php
                "intelephense",
                "phpcs",
                "php-cs-fixer",

                -- Python
                "ruff",
                "isort",
                "pyright",
                "djlint", -- For web

                -- Web Things
                "css-lsp",
                "emmet-language-server",
                "eslint_d",
                "html-lsp",
                "prettierd",
                "typescript-language-server",
            }
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
        end,
    },
}
