return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Jump to next git c[h]ange" })
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Jump to previous git c[h]ange" })

				-- Actions
				-- Visual mode
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage git hunk" })
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset git hunk" })

				-- normal mode
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
				map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
				map("n", "<leader>gb", gitsigns.blame_line, { desc = "git [b]lame line" })
				map("n", "<leader>gd", gitsigns.diffthis, { desc = "git [d]iff against index" })
				map("n", "<leader>gD", function()
					gitsigns.diffthis("@")
				end, { desc = "git [D]iff against last commit" })

				-- Toggles
				map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
				map("n", "<leader>gtD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })
			end,
		},
	},
	{
		"isakbm/gitgraph.nvim",
		opts = {
			symbols = {
				merge_commit = "M",
				commit = "*",
			},
			format = {
				timestamp = "%H:%M:%S %d-%m-%Y",
				fields = { "hash", "timestamp", "author", "branch_name", "tag" },
			},
			hooks = {
				on_select_commit = function(commit)
					print("selected commit:", commit.hash)
				end,
				on_select_range_commit = function(from, to)
					print("selected range:", from.hash, to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gg",
				function()
					require("gitgraph").draw({}, { all = true, max_count = 5000 })
				end,
				desc = "git [G]raph",
			},
		},
	},
}
