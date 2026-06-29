return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local wk = require("which-key")

		harpoon:setup()

		wk.add({
			{
				"<leader>ha",
				function()
					harpoon:list():add()
				end,
				desc = "Add File",
			},
			{
				"<leader>hd",
				function()
					harpoon:list():remove()
				end,
				desc = "Remove File",
			},
			{
				"<leader>h1",
				function()
					harpoon:list():select(1)
				end,
				desc = "File 1",
			},
			{
				"<leader>h2",
				function()
					harpoon:list():select(2)
				end,
				desc = "File 2",
			},
			{
				"<leader>h3",
				function()
					harpoon:list():select(3)
				end,
				desc = "File 3",
			},
			{
				"<leader>h4",
				function()
					harpoon:list():select(4)
				end,
				desc = "File 4",
			},
			{
				"<leader>hn",
				function()
					harpoon:list():next()
				end,
				desc = "Next",
			},
			{
				"<leader>hp",
				function()
					harpoon:list():prev()
				end,
				desc = "Previous",
			},
		})
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Menu" })
	end,
}
