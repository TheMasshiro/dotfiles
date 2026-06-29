---@module 'lazy'
---@type LazySpec
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("catppuccin").setup()
		vim.cmd.colorscheme("catppuccin")
	end,
}
