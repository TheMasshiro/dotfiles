---@module 'lazy'
---@type LazySpec
return {
	{
		-- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "vimEnter",
		---@module 'which-key'
		---@type wk.Opts
		---@diagnostic disable-next-line: missing-fields
		opts = {
			preset = "modern",
			-- Delay between pressing a key and opening which-key (milliseconds)
			delay = 0,
			-- Disable
			disable = {
				ft = { "alpha" },
			},
			icons = { mappings = vim.g.have_nerd_font },
			-- Document existing key chains
			spec = {
				{ "<leader>b", group = "Buffer" },
				{ "<leader>g", group = "Git Hunk", mode = { "n", "v" } },
				{ "<leader>h", group = "Harpoon", icon = "󰛢" },
				{ "<leader>hl", group = "Lazy", mode = { "n", "v" } },
				{ "<leader>f", group = "Find", mode = { "n", "v" } },
				{ "<leader>t", group = "Toggle" },
				{ "gr", group = "LSP Actions", mode = { "n" } },
			},
		},
	},
}
