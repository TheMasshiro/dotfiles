return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e square",
					height = 5,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					desc = "Git Files",
					padding = 1,
					key = "b",
					action = function()
						Snacks.picker.git_files()
					end,
				},
				{
					pane = 2,
					icon = " ",
					desc = "Lazygit",
					padding = 1,
					key = "B",
					action = function()
						Snacks.lazygit()
					end,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							title = "Notifications",
							cmd = "gh notify -s -a -n5",
							action = function()
								vim.ui.open("https://github.com/notifications")
							end,
							key = "N",
							icon = " ",
							height = 5,
							enabled = true,
						},
						{
							icon = " ",
							title = "Git Status",
							cmd = "git --no-pager diff --stat -B -M -C",
							height = 10,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							pane = 2,
							section = "terminal",
							enabled = in_git,
							padding = 1,
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,
				{ section = "startup" },
			},
		},
	},
}
