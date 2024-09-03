return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["\\"] = { callback = "actions.close", mode = "n" },
				["q"] = { callback = "actions.close", mode = "n" },
			},

			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "\\e", oil.toggle_float, { desc = "Oil: Open [E]xplorer" })
	end,
}
