return {
	"syntaxpresso/bufstate.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		filter_by_tab = true, -- Enable tab-based buffer filtering
		autoload_last_session = true, -- Auto-load latest session on startup
		stop_lsp_on_tab_leave = true, -- Kills language server between tab changes
		autosave = {
			enabled = true, -- Enable autosave
			on_exit = true, -- Save on exit
			interval = 300000, -- Auto-save every 5 minutes
			debounce = 30000, -- Min 30s between saves
		},
	},
}
