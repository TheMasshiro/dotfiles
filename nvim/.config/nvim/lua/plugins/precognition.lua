return {
	"tris203/precognition.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>bm", function()
			require("precognition").toggle()
		end, { desc = "Show [M]otions" })
	end,
}
