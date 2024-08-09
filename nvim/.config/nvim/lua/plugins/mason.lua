return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- LSP
				"clangd",
				"pyright",
				"tsserver",
				"html",
				"cssls",
				"jsonls",
				"marksman",
				"lua_ls",
				"emmet_language_server",

				-- Go
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Python
				"ruff",
				"djlint",

				-- Javascript/HTML/CSS
				"eslint_d",
				"prettier",

				-- C/C++
				"cpplint",
				"clang-format",

				-- Lua
				"stylua",

				-- Go
				"gofumpt",
				"goimports",
				"gomodifytags",
				"golangci-lint",
				"gotests",
				"iferr",
				"impl",
			},
		})
	end,
}
