return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		use_diagnostic_signs = true,
		focus = true,
		action_key = {
			close = { "q", "<esc>" },
			cancel = "<C-c>",
		},
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>xq", ":Trouble quickfix toggle<CR>", desc = "Quickfix List (Trouble)" },
		{ "<leader>xl", ":Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
		{ "<leader>xt", ":Trouble todo toggle<CR>", desc = "Trouble Todos (Trouble)" },
	},
}
