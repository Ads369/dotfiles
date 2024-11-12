local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local screen = wezterm.gui.screens().main
    local ratio = 0.9
    local width, height = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {
        position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
    })
    -- window:gui_window():maximize()
    window:gui_window():set_inner_size(width, height)
end)

local config = {
    color_scheme = "Catppuccin Mocha",
    enable_tab_bar = true,

    font_size = 17.0,
    adjust_window_size_when_changing_font_size = false,
    font = wezterm.font("JetBrains Mono"),

    macos_window_background_blur = 30,
    window_background_opacity = 0.78,
    window_decorations = "RESIZE",

    -- initial_cols = 134,
    -- initial_rows = 30,
    keys = {
        {
            key = "f",
            mods = "CTRL",
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = "k",
            mods = "CMD",
            action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
        },
        {
            key = "k",
            mods = "CTRL",
            action = wezterm.action.ClearScrollback("ScrollbackOnly"),
        },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}

return config
