local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local dimmer = { brightness = 0.1 }
config.background = {
    {
        source = {
            File=os.getenv("HOME") .. "/Pictures/spaceship-warp.png",
        },
        attachment = "Fixed",
        repeat_x = "NoRepeat",
        repeat_y = "NoRepeat",
        vertical_align = 'Middle',
        opacity = 0.95,
        hsb = dimmer,
    }
}

config.text_background_opacity = 0.7
config.enable_tab_bar = false

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 13
-- config.color_scheme = 'AdventureTime'

config.audible_bell = "Disabled"

return config
