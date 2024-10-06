return {
	"echasnovski/mini.operators",
	version = "*",
	event = "VeryLazy",
	opts = {
		replace = {
			prefix = "<leader>s",
		},
	},

	-- Replace/exchange/duplicate text/sort text
	--
	-- - g= - Evaluate text and replace with output
	-- - gx - Exchange text regions
	-- - gm - Duplicate text
	-- - <leader>s - Replace selection with clipboard (visual)
	-- - <leader>ss - Replace line with clipboard (normal)
	-- - gs - Sort text
}
