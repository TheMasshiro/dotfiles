---@module 'lazy'
---@type LazySpec
return {
	"kdheepak/lazygit.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>glg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
	},
}
