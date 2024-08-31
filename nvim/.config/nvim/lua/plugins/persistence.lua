return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	keys = {
		{
			-- load the session for the current directory
			"<leader>wl",
			function()
				require("persistence").load()
			end,
			desc = "Persistence: [L]oad",
		},
		{
			-- select a session to load
			"<leader>we",
			function()
				require("persistence").select()
			end,
			desc = "Persistence: S[E]lect",
		},
		{
			-- load the last session
			"<leader>wa",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Persistence: L[A]st Session",
		},
		{
			-- stop Persistence => session won't be saved on exit
			"<leader>wS",
			function()
				require("persistence").stop()
			end,
			desc = "Persistence: [S]top Session",
		},
	},
	opts = {
		-- add any custom options here
	},
}
