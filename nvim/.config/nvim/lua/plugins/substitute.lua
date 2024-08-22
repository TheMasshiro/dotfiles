return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>s",
			function()
				require("substitute").operator()
			end,
			mode = { "n" },
			desc = "[S]ubstitute with motion",
		},
		{
			"<leader>ss",
			function()
				require("substitute").line()
			end,
			mode = { "n" },
			desc = "[S]ub[S]titute line",
		},
		{
			"<leader>se",
			function()
				require("substitute").eol()
			end,
			mode = { "n" },
			desc = "[S]ubstitut[E] to end of line",
		},
		{
			"<leader>s",
			function()
				require("substitute").visual()
			end,
			mode = { "x" },
			desc = "[S]ubstitute in visual mode",
		},
	},
	opts = {},
}
