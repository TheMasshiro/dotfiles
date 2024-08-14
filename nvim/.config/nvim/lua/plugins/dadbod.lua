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
		vim.keymap.set("n", "<leader>nd", ":DBUI<CR>", { desc = "Open Database (dadbod)" })
		vim.keymap.set("n", "<leader>nn", ":DBUIToggle<CR>", { desc = "Toggle Database (dadbod)" })
	end,
}
