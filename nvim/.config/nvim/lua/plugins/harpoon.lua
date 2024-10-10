return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>aa",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: [A]dd",
		},
		{
			"<leader>ar",
			function()
				require("harpoon"):list():remove()
			end,
			desc = "Harpoon: [R]emove",
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
		},
		{
			"<C-A-p>",
			function()
				require("harpoon"):list():prev()
			end,
		},
		{
			"<C-A-n>",
			function()
				require("harpoon"):list():next()
			end,
		},
	},
}
