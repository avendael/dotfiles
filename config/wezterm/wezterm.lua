local wezterm = require 'wezterm'

local TAB_EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_EDGE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick
--local TITLE_BG_COLOR = wezterm.color.parse('#e4e5f1')
--local TITLE_FG_COLOR = wezterm.color.parse('#383a42')
local TITLE_BG_COLOR = wezterm.color.parse('#262932')
local TITLE_FG_COLOR = wezterm.color.parse('#ebdbb2')

local launch_menu = {}
local action = wezterm.action

local function tab_title(tab_info)
    local title = tab_info.tab_title

    if title and #title > 0 then
        return title
    end

    return tab_info.active_pane.title
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    })
end

wezterm.on(
    'format-tab-title',
    function(tab, _, _, _, hover, _)
        local edge_background = TITLE_BG_COLOR
        local background = TITLE_BG_COLOR:lighten(0.12)
        local foreground = TITLE_FG_COLOR
        local title = tab_title(tab)

        if tab.is_active then
            background = background:lighten(0.12)
            foreground = foreground
        elseif hover then
            background = background:lighten(0.05)
            foreground = foreground:darken(0.1)
        end

        local edge_foreground = background

        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = TAB_EDGE_LEFT },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = TAB_EDGE_RIGHT },
        }
    end
)

return {
    use_fancy_tab_bar = true,
    enable_tab_bar = true,
    show_tab_index_in_tab_bar = false,
    show_new_tab_button_in_tab_bar = false,
    color_scheme = 'BlulocoDark',
    colors = {
        tab_bar = {
            inactive_tab_edge = TITLE_BG_COLOR,
        },
        split = TITLE_BG_COLOR:lighten(0.3):desaturate(0.5)
    },
    window_frame = {
        active_titlebar_bg = TITLE_BG_COLOR,
        inactive_titlebar_bg = TITLE_BG_COLOR,
    },
    font = wezterm.font_with_fallback {
        'Hack Nerd Font',
        'FiraMono Nerd Font',
    },
    font_size = 11,
    default_cursor_style = 'BlinkingBlock',
    launch_menu = launch_menu,
    default_prog = { 'powershell.exe', '-NoLogo' },
    enable_scroll_bar = false,
    scrollback_lines = 10000,
    hide_tab_bar_if_only_one_tab = false,
    check_for_updates = true,
    window_decorations = 'RESIZE',
    window_background_opacity = 0.85,
    leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1500 },
    keys = {
        { key = 'T', mods = 'LEADER', action = action.ShowLauncher },
        { key = 't', mods = 'LEADER', action = action.SpawnTab 'DefaultDomain' },
        { key = 'v', mods = 'LEADER', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 's', mods = 'LEADER', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'h', mods = 'LEADER', action = action.ActivatePaneDirection 'Left' },
        { key = 'j', mods = 'LEADER', action = action.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'LEADER', action = action.ActivatePaneDirection 'Up' },
        { key = 'l', mods = 'LEADER', action = action.ActivatePaneDirection 'Right' },
        { key = 'L', mods = 'LEADER', action = action.ActivateTabRelative(1) },
        { key = 'H', mods = 'LEADER', action = action.ActivateTabRelative(-1) },
        { key = 'z', mods = 'LEADER', action = action.TogglePaneZoomState },
        { key = '[', mods = 'LEADER', action = action.ActivateCopyMode },
        { key = 'r', mods = 'LEADER', action = action.ReloadConfiguration },
        { key = 'f', mods = 'LEADER', action = action.ScrollByPage(1) },
        { key = 'b', mods = 'LEADER', action = action.ScrollByPage(-1) },
    },
}
