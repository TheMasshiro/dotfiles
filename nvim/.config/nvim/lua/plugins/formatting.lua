return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				lua = { "stylua" },
				python = { "isort", "ruff_format" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				htmldjango = { "djlint" },
				go = { "goimports", "gofmt" },
				-- Use a sub-list to run only the first available formatter
			},
			format_on_save = {
				timeout_ms = 7000, -- default value 3000 changed it due to hdd limitation
				async = false,
				quiet = false,
				lsp_format = "fallback",
			},
		},
	},
}
