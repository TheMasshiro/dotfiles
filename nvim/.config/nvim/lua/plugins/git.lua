return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			sign_priority = 15, -- higher than diagnostic,todo signs. lower than dapui breakpoint sign
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk (gitsigns)")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk (gitsigns)")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk (gitsigns)")
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk (gitsigns)")
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk (gitsigns)")

				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer (gitsigns)")
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer (gitsigns)")

				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk (gitsigns)")

				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk (gitsigns)")

				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame line (gitsigns)")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame (gitsigns)")

				map("n", "<leader>gd", gs.diffthis, "Diff this (gitsigns)")
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff this ~ (gitsigns)")

				-- Text object
				map({ "o", "x" }, "gi", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk (gitsigns)")
			end,
		},
	},
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"isakbm/gitgraph.nvim",
		dependencies = { "sindrets/diffview.nvim" },
		---@type I.GGConfig
		opts = {
			symbols = {
				merge_commit = "M",
				commit = "*",
			},
			format = {
				timestamp = "%H:%M:%S %d-%m-%Y",
				fields = { "hash", "timestamp", "author", "branch_name", "tag" },
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>gg", function()
				require("gitgraph").draw({}, { all = true, max_count = 5000 })
			end, { desc = "Git Graph" })
		end,
	},
}
