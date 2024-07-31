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
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Quickfix List (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Trouble Todos (Trouble)" },
	},
}
