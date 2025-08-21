-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "9",
		mods = "CTRL",
		action = act.PaneSelect({
			alphabet = "1234567890",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Send "CTRL-Q" to the terminal when pressing CTRL-Q, CTRL-Q
	{
		key = "q",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "q", mods = "CTRL" }),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "DownArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "RightArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.initial_cols = 150
config.initial_rows = 50

config.colors = {
	foreground = "#ffffff",
	background = "#16181a",

	cursor_bg = "#ffffff",
	cursor_fg = "#16181a",
	cursor_border = "#ffffff",

	selection_fg = "#ffffff",
	selection_bg = "#3c4048",

	scrollbar_thumb = "#16181a",
	split = "#16181a",

	ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
	brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
	indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 9

config.window_background_gradient = {
	colors = {
		-- "#23003A",
		-- "#270040",
		-- "#340452",
		-- "#3D0C5C",
		-- "#451365",
		-- "#4C1C62",
		-- "#41005B",
		-- "#38004F",
		-- "#2F0042",
		-- "#230030",
		--
		"#18005F",
		"#20005E",
		"#28005D",
		"#2F005C",
		"#37005B",
		"#3F0059",
		"#470058",
		"#4E0057",
		"#560056",
		"#5E0055",
		--
		-- "#0f0c29",
		-- "#302b63",
		-- "#24243e",
	},
	-- Specifies a Linear gradient starting in the top left corner.
	orientation = { Linear = { angle = -45.0 } },
	-- orientation = "Horizontal",
	-- preset = "Magma",
}

return config
