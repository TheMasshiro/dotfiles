return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files (Telescope)" })
		keymap.set("n", "<leader>fg", ":Telescope git_files<CR>", { desc = "Git Files (Telescope)" })
		keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent Files (Telescope)" })
		keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Grep Search (Telescope)" })
		keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Grep search under cursor (Telescope)" })
		keymap.set("n", "<leader>ft", "<:>TodoTelescope<CR>", { desc = "Find Todos (Todo)" })
	end,
}
