return {
	"tris203/precognition.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>bA", function()
			require("precognition").toggle()
		end, { desc = "Show Motions (Precognition)" })
	end,
}
