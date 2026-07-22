-- by: William C. Canin - 2026

-- Terminal background and foreground
local colors_custom = {
  bg = "#1a1a1a",
  bg_inactive = "#111111",
  fg = "#9f9f9f",
  fg_inactive =  "#616161",
  window_border = "#565656"
}

-- ================= BASE =================
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_background_opacity = 1.0  -- Default: 1.0
config.initial_cols = 164
config.initial_rows = 39

-- config.color_scheme = "Builtin Dark"

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.pane_focus_follows_mouse = true


config.window_decorations            = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_buttons      = { 'Hide', 'Maximize', 'Close' }
config.integrated_title_button_style = 'Gnome'
config.integrated_title_button_alignment = 'Right'
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.font = wezterm.font_with_fallback {
  { family = 'JetBrainsMono Nerd Font', weight = 'Regular' },
  { family = 'Fira Code',               weight = 'Regular' },
    'Noto Color Emoji',
}
config.font_size = 13
config.tab_max_width = 28
config.animation_fps = 1
config.max_fps = 120
config.front_end = "OpenGL"
config.enable_wayland = true
config.use_dead_keys = true

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.skip_close_confirmation_for_processes_named = {
  'bash', 'zsh', 'sh', 'fish',
}

config.adjust_window_size_when_changing_font_size = false

-- ================= WINDOW FRAME =================
config.window_frame = {
  active_titlebar_bg   = colors_custom.bg,
  inactive_titlebar_bg = colors_custom.bg,

  button_bg = colors_custom.bg,
  button_fg = colors_custom.fg,

  button_hover_fg = colors_custom.bg,
  button_hover_bg = colors_custom.fg,

  border_left_width = '1px',
  border_right_width = '1px',
  border_bottom_height = '1px',
  border_top_height = '1px',
  border_left_color = colors_custom.window_border,
  border_right_color = colors_custom.window_border,
  border_bottom_color = colors_custom.window_border,
  border_top_color = colors_custom.window_border,
}

-- ================= WINDOW TAB BUTTONS =================
-- macOS Style: close: #ff5f57|#dc4a43, maximize: #febc2e|#d6a335, hide: #28c840|#2ba33d

config.tab_bar_style = {
  window_close = wezterm.format {
    { Foreground = { Color = "#949494" } },
    { Text = " ● " },
  },
  window_close_hover = wezterm.format {
    { Foreground = { Color = "#7f7f7f" } },
    { Text = " ● " },
  },
  window_maximize = wezterm.format {
    { Foreground = { Color = "#747474" } },
    { Text = " ● " },
  },
  window_maximize_hover = wezterm.format {
    { Foreground = { Color = "#616161" } },
    { Text = " ● " },
  },
  window_hide = wezterm.format {
    { Foreground = { Color = "#5c5c5c" } },
    { Text = " ● " },
  },
  window_hide_hover = wezterm.format {
    { Foreground = { Color = "#4b4b4b" } },
    { Text = " ● " },
  },
}

-- ================= COLORS =================
config.colors = {
  background = colors_custom.bg,

  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = colors_custom.bg,

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = false,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = colors_custom.bg,
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = colors_custom.bg,
      fg_color = '#909090',
      italic = false,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

-- ================= BINDINGS =================
local act = wezterm.action

config.mouse_bindings = {
  -- Copy by selecting text
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = act.CompleteSelection("ClipboardAndPrimarySelection"),
  },

  -- Right-click paste
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom("Clipboard"),
  },
}

-- Shortcuts keys
config.keys = {
  -- Navigation on tab with Ctrl+Tab
  { key = 'Tab', mods = 'CTRL',       action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  {
    -- Close tab
    key = 'q',
    mods = 'CTRL',
    action = act.CloseCurrentTab { confirm = false },
  },
  {
    -- New tab
    key = 'n',
    mods = 'CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Fullscreen
  {
    key = 'F11',
    mods = '',
    action = act.ToggleFullScreen,
  },
  -- Splits pane
  { key = 'd', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'CTRL|SHIFT', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },
  { key = 'LeftArrow',  mods = 'ALT', action = act.ActivatePaneDirection 'Left'  },
  { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = act.ActivatePaneDirection 'Up'    },
  { key = 'DownArrow',  mods = 'ALT', action = act.ActivatePaneDirection 'Down'  },

  -- Zoom pane
  { key = 'z', mods = 'CTRL', action = act.TogglePaneZoomState },

  -- Font zoom
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize  },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize  },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize     },

}

-- ================= SCROLL =================
config.enable_scroll_bar = false
config.scroll_to_bottom_on_input = true
config.swallow_mouse_click_on_pane_focus = false
config.alternate_buffer_wheel_scroll_speed = 1
config.min_scroll_bar_height = "0.5cell"
config.scrollback_lines = 100000
config.bypass_mouse_reporting_modifiers = "SHIFT"

-- ================= PADDING =================
config.window_padding = {
  left = 10,
  right = 10,
  top = 4,
  bottom = 4,
}

-- ================= ICONS in TABS =================
local icons = {
  nvim = " ",
  vim = " ",
  zsh = " ",
  bash = " ",
  ssh = "󰣀 ",
  docker = " ",
}

wezterm.on("format-tab-title", function(tab)
  local pane = tab.active_pane
  local proc = ""

  if pane.foreground_process_name then
    proc = pane.foreground_process_name:match("([^/]+)$") or ""
  end

  local icon = icons[proc] or " "
  local title = pane.title or ""

  local bg = colors_custom.bg_inactive
  local fg = colors_custom.fg_inactive

  if tab.is_active then
    bg = colors_custom.bg
    fg = colors_custom.fg
  end

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },

    { Text = "  " .. icon .. title .. "  " },
  }
end)

-- Apply
return config
