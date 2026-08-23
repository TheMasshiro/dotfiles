---@module 'lazy'
---@type LazySpec
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-mini/mini.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("SPC f f", "󰱼   Search file", ":Telescope find_files<CR>"),
			dashboard.button("SPC f g", "󰨼   Search word", ":Telescope live_grep<CR>"),
			dashboard.button("SPC f .", "󰥨   Search recent", ":Telescope oldfiles<CR>"),
			dashboard.button("L", "󰒲   Lazy", ":Lazy<CR>"),
			dashboard.button("q", "󰈆   Quit NVIM", ":qa<CR>"),
		}

		local stats = require("lazy").stats()
		dashboard.section.footer.val = stats.count
			.. " plugins 󰃭 "
			.. os.date("%d-%m-%Y")
			.. " 󰄛 "
			.. os.date("%I:%M %p")

		alpha.setup(dashboard.opts)
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
