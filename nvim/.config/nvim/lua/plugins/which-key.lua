return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>a", group = "H[A]rpoon" },
				{ "<leader>b", group = "[B]uffer" },
				{ "<leader>c", group = "A[C]tion" },
				{ "<leader>d", group = "[D]ebugger" },
				{ "<leader>f", group = "[F]ile" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>h", group = "[H]arpoon" },
				{ "<leader>l", group = "[L]sp" },
				{ "<leader>n", group = "[D]atabase" },
				{ "<leader>r", group = "[R]efactor" },
				{ "<leader>s", group = "[S]ubstitute" },
				{ "<leader>t", group = "[T]ests" },
				{ "<leader>e", group = "S[E]ssion" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>x", group = "quickfi[X]" },
				{ "<leader>z", group = "[Z]en" },
				{ "<leader>gt", group = "[G]it [T]oggle" },
			},
		},
	},
}
