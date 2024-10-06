return {
	"echasnovski/mini.notify",
	version = "*",
	event = "VeryLazy",
	opts = {},

	config = function()
		local notify = require("mini.notify")
		vim.notify = notify.make_notify()

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				local filename = vim.fn.expand("%:t")
				vim.notify("File saved: " .. filename, vim.log.levels.INFO, {})
			end,
		})
	end,
}
