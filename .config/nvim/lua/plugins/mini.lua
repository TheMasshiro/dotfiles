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
	config = function()
		require("plugins.mini.ai")()
		require("plugins.mini.bracketed")()
		require("plugins.mini.cursorword")()
		require("plugins.mini.files")()
		require("plugins.mini.git")()
		require("plugins.mini.icons")()
		require("plugins.mini.operators")()
		require("plugins.mini.pairs")()
		require("plugins.mini.splitjoin")()
		require("plugins.mini.surround")()
		require("plugins.mini.trailspace")()
	end,
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
}
