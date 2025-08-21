return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
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
			end, { desc = "Jump to next hunk" })

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Jump to previous hunk" })

			-- Actions
			-- Visual mode
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage Hunk" })

			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset Hunk" })

			-- normal mode
			map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage/Unstage Hunk" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
			map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
			map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
			map("n", "<leader>hb", gitsigns.blame_line, { desc = "Blame Line" })
			map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff Against Index" })
			map("n", "<leader>hD", function()
				gitsigns.diffthis("@")
			end, { desc = "Diff Against Last Commit" })

			-- Toggles
			map("n", "<leader>htb", gitsigns.toggle_current_line_blame, { desc = "Toggle Blame Line" })
			map("n", "<leader>htD", gitsigns.preview_hunk_inline, { desc = "Toggle Deleted" })
		end,
	},
}
