return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>st",
			"<cmd>TodoQuickFix<cr>",
			desc = "Search Todo Quickfix",
		},
		{
			"<leader>sT",
			"<cmd>TodoLocList<cr>",
			desc = "Search Todo Loclist",
		},
	},
}
