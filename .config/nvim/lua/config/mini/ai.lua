-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
return {
	setup = function()
		require("mini.ai").setup({
			-- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
			mappings = {
				around_next = "aa",
				inside_next = "ii",
			},
			n_lines = 500,
		})
	end,
}
