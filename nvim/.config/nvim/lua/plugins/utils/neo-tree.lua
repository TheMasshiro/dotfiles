return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"\\f",
			":Neotree reveal<CR>",
			desc = "Neotree: [F]ile tree",
			silent = true,
		},
		{ "\\g", ":Neotree toggle git_status<CR>", desc = "Neotree: [G]it tree", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
			},
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
		close_if_last_window = true,
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
		git_status = {
			symbols = {
				unstaged = "󰄱",
				staged = "󰱒",
			},
		},
	},
}
