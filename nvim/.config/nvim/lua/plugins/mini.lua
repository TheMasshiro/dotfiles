return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Replace/exchange/duplicate text/sort text
		--
		-- - g= - Evaluate text and replace with output
		-- - gx - Exchange text regions
		-- - gm - Duplicate text
		-- - <leader>s - Replace selection with clipboard (visual)
		-- - <leader>ss - Replace line with clipboard (normal)
		-- - gs - Sort text
		require("mini.operators").setup({
			replace = {
				prefix = "<leader>s",
			},
		})

		-- :Git command for executing any git call inside file's repository root with deeper current instance integration (show output as notification/buffer, use to edit commit messages, etc.).
		--
		require("mini.git").setup()

		local notify = require("mini.notify")
		notify.setup()
		vim.notify = notify.make_notify()

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				local filename = vim.fn.expand("%:t")
				vim.notify("File saved: " .. filename, vim.log.levels.INFO, {})
			end,
		})
		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
