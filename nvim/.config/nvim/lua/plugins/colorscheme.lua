return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha, or auto
		integrations = {
			cmp = true,
			dadbod_ui = true,
			dap = true,
			dap_ui = true,
			dashboard = true,
			fidget = true,
			flash = true,
			grug_far = true,
			gitsigns = true,
			harpoon = true,
			indent_blankline = { enabled = true },
			lsp_trouble = true,
			mason = true,
			markdown = true,
			mini = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			neotest = true,
			neotree = true,
			render_markdown = true,
			semantic_tokens = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			which_key = true,
		},

		function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
