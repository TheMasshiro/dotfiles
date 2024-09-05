return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>bu", ":lua require('undotree').toggle()<CR>", desc = "[U]ndotree" },
	},
}
