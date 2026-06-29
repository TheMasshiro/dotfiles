---@module 'lazy'
---@type LazySpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "\\t", "<Cmd>Neotree reveal<CR>", desc = "[T]ree Reveal", silent = true },
	},
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		filesystem = {
			window = {
				width = 30,
				mappings = {
					["\\t"] = { "close_window", desc = "[T]oggle Tree" },
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		},
	},
}
