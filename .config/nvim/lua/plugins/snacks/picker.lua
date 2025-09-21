return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						layout = {
							width = 30,
						},
					},
					win = {
						list = {
							keys = {
								["o"] = "confirm",
							},
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"\\nh",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},

		{
			"\\S",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"\\bl",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"\\bu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},

		{
			"\\C",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},

		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
	},
}
