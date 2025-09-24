local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.check_for_updates = true
config.default_prog = { "wsl.exe", "--cd", "~" }

-- Set font and size
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13.0 -- Adjust font size here
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Disable ligatures

config.color_scheme = "rose-pine"
config.colors = {
	tab_bar = {
		background = "#191724",
		active_tab = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#191724",
			fg_color = "#908caa",
		},
		inactive_tab_hover = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
			italic = true,
		},
		new_tab = {
			bg_color = "#191724",
			fg_color = "#908caa",
		},
		new_tab_hover = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
			italic = true,
		},
	},
}

wezterm.on("format-tab-title", function(tab)
	local icon = "  "
	local index = tostring(tab.tab_index + 1)
	local title = icon .. index .. " "

	if tab.is_active then
		return {
			{ Text = title },
		}
	end

	return {
		{ Text = title },
	}
end)

-- Cursor config
config.default_cursor_style = "SteadyBlock"
config.force_reverse_video_cursor = false

-- Configurations
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.window_close_confirmation = "AlwaysPrompt"

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Set scrollback
config.scrollback_lines = 10000

-- Set wezterm to fullscreen
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- Tmux
config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}
config.keys = {
	{
		mods = "LEADER",
		key = "q",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "wsl.exe" },
		}),
	},
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "w",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "p",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "\\",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "h",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "l",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "j",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "k",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
