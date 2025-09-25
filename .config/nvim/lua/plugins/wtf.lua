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
			"<leader>xd",
			mode = { "n", "x" },
			function()
				require("wtf").diagnose()
			end,
			desc = "Debug diagnostic with AI",
		},
		{
			"<leader>xf",
			mode = { "n", "x" },
			function()
				require("wtf").fix()
			end,
			desc = "Fix diagnostic (AI)",
		},
		{
			mode = { "n" },
			"<leader>xs",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic (Online)",
		},
		{
			mode = { "n" },
			"<leader>xh",
			function()
				require("wtf").history()
			end,
			desc = "AI Chat History",
		},
	},
}
