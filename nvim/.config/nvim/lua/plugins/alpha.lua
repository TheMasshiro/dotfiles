return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"",
			"",
			"  ██████   █████                   █████   █████  ███                  ",
			" ░░██████ ░░███                   ░░███   ░░███  ░░░                   ",
			"  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ",
			"  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ",
			"  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ",
			"  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ",
			"  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ",
			" ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ",
			"",
			"",
		}

		dashboard.section.buttons.val = {
			dashboard.button("SPC wr", "  󰁯  Restore Session", ":SessionRestore<CR>"),
			dashboard.button("SPC fr", "  󰱼  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("SPC ff", "  󰱼  Find Files", ":Telescope find_files<CR>"),
			dashboard.button("SPC fg", "  󰱼  Git Files", ":Telescope git_files<CR>"),
			dashboard.button("SPC fs", "    Find Word", ":Telescope live_grep<CR>"),
			dashboard.button("SPC fd", "    File Explorer", ":Oil --float<CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
