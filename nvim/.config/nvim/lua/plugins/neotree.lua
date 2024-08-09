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
		{ "<leader>fne", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree (Neotree)" },
		{
			"<leader>fnn",
			"<cmd>Neotree toggle reveal<CR>",
			desc = "Toggle file tree on current file (Neotree)",
		},
		{ "<leader>fng", "<cmd>Neotree toggle git_status<CR>", desc = "Toggle git status tree (Neotree)" },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
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
