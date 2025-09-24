return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	keys = {
		{
			"af",
			function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end,
			desc = "Select outer function",
			mode = { "x", "o" },
		},
		{
			"if",
			function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end,
			desc = "Select inner function",
			mode = { "x", "o" },
		},
		{
			"ac",
			function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end,
			desc = "Select outer class",
			mode = { "x", "o" },
		},
		{
			"ic",
			function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end,
			desc = "Select inner class",
			mode = { "x", "o" },
		},
		{
			"as",
			function()
				require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
			end,
			desc = "Select local scope",
			mode = { "x", "o" },
		},
	},
	---@module "nvim-treesitter-textobjects"
	opts = { multiwindow = true },
}
