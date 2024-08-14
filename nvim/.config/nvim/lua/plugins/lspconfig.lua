return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy.nvim",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			-- import mason_lspconfig plugin
			local mason_lspconfig = require("mason-lspconfig")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap -- for conciseness

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- set keybinds
					opts.desc = "Show References (LSP)"
					keymap.set("n", "<leader>lgR", ":Telescope lsp_references<CR>", opts) -- show definition, references

					opts.desc = "Go to Declaration (LSP)"
					keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, opts) -- go to declaration

					opts.desc = "Show Definitions (LSP)"
					keymap.set("n", "<leader>ld", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions

					opts.desc = "Show Implementations (LSP)"
					keymap.set("n", "<leader>li", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations

					opts.desc = "Show Type Definitions (LSP)"
					keymap.set("n", "<leader>lt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

					opts.desc = "Format Buffer"
					keymap.set("n", "<leader>bf", vim.lsp.buf.format, opts)

					opts.desc = "Show Diagnostics (LSP)"
					keymap.set("n", "<leader>lD", ":Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show Line Diagnostics (LSP)"
					keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Jump to previous diagnostic"
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

					opts.desc = "Jump to next diagnostic"
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

					opts.desc = "Hover Snippet (LSP)"
					keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart (LSP)"
					keymap.set("n", "<leader>lq", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			})

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason_lspconfig.setup_handlers({
				-- default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					lspconfig["pyright"].setup({
						capabilities = capabilities,
						settings = {
							python = {
								analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
							},
						},
					})
				end,
				["emmet_language_server"] = function()
					-- configure emmet language server
					lspconfig["emmet_language_server"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"htmldjango",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			})
		end,
	},
}
