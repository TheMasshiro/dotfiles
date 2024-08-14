return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>d", group = "debugger" },
				{ "<leader>f", group = "file/find/search" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "harpoon" },
				{ "<leader>l", group = "lsp" },
				{ "<leader>n", group = "database" },
				{ "<leader>r", group = "refactor" },
				{ "<leader>s", group = "substitute" },
				{ "<leader>t", group = "tests" },
				{ "<leader>w", group = "session" },
				{ "<leader>x", group = "diagnostics/quickfix" },
				{ "<leader>fn", group = "file tree" },
				{ "<leader>lg", group = "go to" },
				{ "z", group = "fold" },
				{ "[", group = "prev" },
				{ "]", group = "next" },
			},
		},
	},
}
