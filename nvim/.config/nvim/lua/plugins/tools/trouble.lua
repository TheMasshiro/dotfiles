return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		use_diagnostic_signs = true,
		focus = true,
		action_key = {
			close = { "q", "<esc>" },
			cancel = "<C-c>",
		},
	},
	keys = {
		{ "<leader>xd", ":Trouble diagnostics toggle<CR>", desc = "Trouble: [D]iagnostics" },
		{ "<leader>xb", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: [B]uffer Diagnostics" },
		{ "<leader>xq", ":Trouble quickfix toggle<CR>", desc = "Trouble: [Q]uickfix List" },
		{ "<leader>xl", ":Trouble loclist toggle<CR>", desc = "Trouble: [L]ocation List" },
		{ "<leader>xt", ":Trouble todo toggle<CR>", desc = "Trouble: [T]odos" },
	},
}
