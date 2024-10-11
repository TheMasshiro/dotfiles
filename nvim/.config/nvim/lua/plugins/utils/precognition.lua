return {
	"tris203/precognition.nvim",
	keys = {
		{
			"<leader>bm",
			function()
				require("precognition").toggle()
			end,
			desc = "Show [M]otions",
		},
	},
	opts = {
		startVisible = false,
		disabled_fts = {
			"qf",
			"netrw",
			"NvimTree",
			"lazy",
			"mason",
			"oil",
			"neo-tree",
			"dbui",
			"dashboard",
		},
	},
}
