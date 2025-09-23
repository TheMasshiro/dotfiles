return {
	"echasnovski/mini.nvim",
	version = false,
	keys = {
		{
			"\\f",
			"<Cmd>silent! lua MiniFiles.open()<CR>",
			desc = "File Explorer",
		},
	},
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	config = function()
		require("plugins.mini.ai")()
		require("plugins.mini.bracketed")()
		require("plugins.mini.clue")()
		require("plugins.mini.cursorword")()
		require("plugins.mini.files")()
		require("plugins.mini.git")()
		require("plugins.mini.hipatterns")()
		require("plugins.mini.icons")()
		require("plugins.mini.operators")()
		require("plugins.mini.pairs")()
		require("plugins.mini.splitjoin")()
		require("plugins.mini.surround")()
		require("plugins.mini.trailspace")()
	end,
}
