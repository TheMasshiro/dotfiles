return {
	"folke/snacks.nvim",
	opts = {
		notifier = {
			enabled = true,
			timeout = 3000,
		},

		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
	},
	keys = {
		{
			"\\nu",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
	},
}
