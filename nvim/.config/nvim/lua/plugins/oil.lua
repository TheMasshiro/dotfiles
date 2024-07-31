return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({})
		vim.keymap.set("n", "<leader>fd", oil.toggle_float, { desc = "Open Directory (Oil)" })
	end,
}
