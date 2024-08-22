return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Desktop", "/" },
		})
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		vim.keymap.set("n", "<leader>er", ":SessionRestore<CR>", { desc = "[R]estore session" })
		vim.keymap.set("n", "<leader>es", ":SessionSave<CR>", { desc = "[S]ave session" })
	end,
}
