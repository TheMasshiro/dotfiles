local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.check_for_updates = true
config.default_prog = { "wsl.exe", "--cd", "~" }

-- Font
config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")
config.font_size = 13.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Colorscheme
config.color_scheme = "Everforest Dark Hard (Gogh)"
config.colors = {
	tab_bar = {
		background = "#272e33",
		active_tab = {
			bg_color = "#272e33",
			fg_color = "#d3c6aa",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#1e2326",
			fg_color = "#859289",
		},
		inactive_tab_hover = {
			bg_color = "#2e383c",
			fg_color = "#d3c6aa",
		},
		new_tab = {
			bg_color = "#1e2326",
			fg_color = "#859289",
		},
		new_tab_hover = {
			bg_color = "#2e383c",
			fg_color = "#d3c6aa",
		},
	},
}

-- Custom tab title (icon + number)
wezterm.on("format-tab-title", function(tab)
	local icon = " 󰇥 "
	local index = tostring(tab.tab_index + 1)
	local title = icon .. index .. " "
	if tab.is_active then
		return {
			{ Foreground = { Color = "#D3C6AA" } },
			{ Background = { Color = "#2D353B" } },
			{ Text = title },
		}
	end
	return {
		{ Foreground = { Color = "#859289" } },
		{ Background = { Color = "#1E2326" } },
		{ Text = title },
	}
end)

-- Cursor
config.default_cursor_style = "SteadyBlock"
config.force_reverse_video_cursor = false

-- Window behavior
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.window_close_confirmation = "AlwaysPrompt"

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Scrollback
config.scrollback_lines = 10000

-- Tmux-like keybindings
config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.keys = {
	{ mods = "LEADER", key = "q", action = wezterm.action.SpawnCommandInNewTab({ args = { "wsl.exe" } }) },
	{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "w", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "p", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "\\", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	{ mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "CTRL|SHIFT", key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ mods = "CTRL|SHIFT", key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ mods = "CTRL|SHIFT", key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ mods = "CTRL|SHIFT", key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ mods = "CTRL|SHIFT", key = "m", action = wezterm.action.TogglePaneZoomState },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
