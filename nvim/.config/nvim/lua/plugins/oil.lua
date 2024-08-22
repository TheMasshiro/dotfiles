return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["\\"] = { callback = "actions.close", mode = "n" },
			},
		})
		vim.keymap.set("n", "\\e", oil.toggle_float, { desc = "Oil: Open [E]xplorer" })
	end,
}
