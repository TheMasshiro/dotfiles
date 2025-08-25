return {
	"piersolenski/wtf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		popup_type = "popup",
		provider = "gemini",
		providers = {
			gemini = {
				api_key = function()
					return os.getenv("GEMINI_API_KEY")
				end,
				model_id = "gemini-2.0-flash",
			},
		},
	},
	keys = {
		{
			"<leader>wd",
			mode = { "n", "x" },
			function()
				require("wtf").diagnose()
			end,
			desc = "Debug diagnostic with AI",
		},
		{
			"<leader>wf",
			mode = { "n", "x" },
			function()
				require("wtf").fix()
			end,
			desc = "Fix diagnostic with AI",
		},
		{
			mode = { "n" },
			"<leader>ws",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic with Google",
		},
		{
			mode = { "n" },
			"<leader>wp",
			function()
				require("wtf").pick_provider()
			end,
			desc = "Pick provider",
		},
		{
			mode = { "n" },
			"<leader>wh",
			function()
				require("wtf").history()
			end,
			desc = "Populate the quickfix list with previous chat history",
		},
	},
}
