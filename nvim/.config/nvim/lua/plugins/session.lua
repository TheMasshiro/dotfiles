return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "~/Desktop", "/" },
		})

		vim.o.sessionoptions = "localoptions"

		vim.keymap.set("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session (Session)" })
		vim.keymap.set("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session (Session)" })
	end,
}
