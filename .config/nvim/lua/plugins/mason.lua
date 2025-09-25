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
				"clang-format",
				"cpplint",

				-- Lua
				"lua-language-server",
				"stylua",

				-- Php
				"intelephense",
				"phpcs",
				"php-cs-fixer",

				-- Python
				"black",
				"djlint", -- For web
				"isort",
				"basedpyright",
				"ruff",

				-- Web Things
				"css-lsp",
				"emmet-language-server",
				"eslint_d",
				"html-lsp",
				"prettierd",
				"typescript-language-server",

				-- Java
				"jdtls",
			}
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		end,
	},
}
