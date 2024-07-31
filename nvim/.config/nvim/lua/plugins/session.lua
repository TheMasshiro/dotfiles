return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "~/Desktop", "/" },
		})

		vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session (Session)" })
		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session (Session)" })
	end,
}
