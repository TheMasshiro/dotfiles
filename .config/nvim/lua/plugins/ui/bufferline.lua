---@module 'lazy'
---@type LazySpec
return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	---@module 'bufferline'
	---@type bufferline.Config
	opts = {
		options = {
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
