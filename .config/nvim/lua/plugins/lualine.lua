return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			section_separators = { left = "█", right = "█" },
			component_separators = { left = "|", right = "|" },
			disabled_filetypes = {
				statusline = { "snacks_dashboard", "snacks_picker_list", "grug-far" },
			},
		},
	},
}
