return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_help = 0
		vim.keymap.set("n", "<leader>no", ":DBUI<CR>", { desc = "[O]pen Dadbod" })
		vim.keymap.set("n", "<leader>nt", ":DBUIToggle<CR>", { desc = "[T]oggle Dadbod" })
	end,
}
