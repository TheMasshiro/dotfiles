return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		max_lines = 2,
		multiwindow = true,
	},
}
