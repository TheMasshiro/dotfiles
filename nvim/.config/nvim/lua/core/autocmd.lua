local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt_local = vim.opt_local

-- Highlight Yank
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Terminal
local terminal = augroup("TerminalLocalOptions", { clear = true })
autocmd("TermOpen", {
	group = terminal,
	pattern = { "*" },
	callback = function()
		opt_local.number = false
		opt_local.relativenumber = false
		opt_local.cursorline = false
		opt_local.signcolumn = "no"
		opt_local.statuscolumn = ""
	end,
})
