return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",

			dim_inactive = {
				enabled = true,
				shade = "dark",

				percentage = 0.10,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
