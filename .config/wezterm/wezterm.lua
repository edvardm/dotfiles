local wezterm = require("wezterm")

local config = wezterm.config_builder()
local dimmer = { brightness = 0.6 }
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/Pictures/wezterm-bg.jpg",
		},
		attachment = "Fixed",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Middle",
		opacity = 0.97,
		hsb = dimmer,
	},
}

config.text_background_opacity = 0.7
config.enable_tab_bar = false

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 13
-- config.color_scheme = 'AdventureTime'

config.audible_bell = "Disabled"
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
