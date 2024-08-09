return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},

				indent = { enable = true },

				autotag = {
					enable = true,
				},

				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dockerfile",
					"gitignore",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"rust",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				auto_install = true,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local ts_context = require("treesitter-context")
			ts_context.setup()

			vim.keymap.set("n", "[c", function()
				ts_context.go_to_context(vim.v.count1)
			end, { silent = true, desc = "Jump to context (Treesitter)" })
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"folke/ts-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"Wansmer/treesj",
		event = { "BufReadPre", "BufNewFile" },
		keys = { { "<space>bm", "<cmd>TSJToggle<CR>", desc = "Toggle Join (TSJ)" } },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = { use_default_keymaps = false },
	},
}
