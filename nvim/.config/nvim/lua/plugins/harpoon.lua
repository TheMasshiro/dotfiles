return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>aa", function()
			harpoon:list():add()
		end, { desc = "Harpoon: [A]dd" })
		vim.keymap.set("n", "<leader>ad", function()
			harpoon:list():remove()
		end, { desc = "Harpoon: [D]elete" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-A-k>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-A-j>", function()
			harpoon:list():next()
		end)
	end,
}
