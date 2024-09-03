return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		spec = {
			{
				{ "<leader>a", group = "H[A]rpoon" },
				{ "<leader>b", group = "[B]uffer" },
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ebugger" },
				{ "<leader>e", group = "S[E]ssion" },
				{ "<leader>f", group = "[F]ile" },
				{ "<leader>g", group = "[G]it", mode = { "n", "x" } },
				{ "<leader>h", group = "[H]arpoon" },
				{ "<leader>l", group = "[L]sp" },
				{ "<leader>n", group = "[D]atabase" },
				{ "<leader>r", group = "[R]efactor" },
				{ "<leader>s", group = "[S]ubstitute" },
				{ "<leader>t", group = "[T]ests" },
				{ "<leader>v", group = "Terminal" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>x", group = "quickfi[X]" },
				-- { "<leader>y", group = "[Y]ank" }, for future use if ever there's a plugin for yank that stores yanked texts
				{ "<leader>z", group = "[Z]en" },
				{ "<leader>gt", group = "[G]it [T]oggle" },
			},
		},

		icons = {
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},
	},
}
