-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font(
  'Fira Code',
  { weight = "Medium", stretch="Normal" }
)
config.font_size = 12
-- For example, changing the color scheme:
config.color_scheme = 'rose-pine'

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
	key = 'f',
	mods = 'LEADER',
	action = wezterm.action.ToggleFullScreen,
  },
  { mods = 'ALT', key = 'Enter', action = wezterm.action.DisableDefaultAssignment },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}
-- and finally, return the configuration to wezterm
return config
