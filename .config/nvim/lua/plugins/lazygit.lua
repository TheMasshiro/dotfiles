---@module 'lazy'
---@type LazySpec
return {
	"kdheepak/lazygit.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>hlg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
	},
}
