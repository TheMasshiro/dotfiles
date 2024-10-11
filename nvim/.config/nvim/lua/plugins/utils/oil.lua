return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	keys = {
		{
			"\\e",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil: Open [E]xplorer",
		},
	},
	opts = {
		keymaps = {
			["\\"] = { callback = "actions.close", mode = "n" },
			["q"] = { callback = "actions.close", mode = "n" },
		},
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
