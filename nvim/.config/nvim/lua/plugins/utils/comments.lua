return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			desc = "[F]ind [T]odo",
		},
	},
	opts = { signs = false },
}
