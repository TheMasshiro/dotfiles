return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup()
		vim.cmd.colorscheme("rose-pine-main")
	end,
}
