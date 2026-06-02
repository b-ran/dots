hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
        allow_tearing = false,
        layout = "dwindle",
    },
    cursor = {
        -- in seconds, after how many seconds of cursor’s inactivity to hide it. Set to 0 for never. --        
        inactive_timeout = 10
    },
    input = {
        natural_scroll = true,
        special_fallthrough = true,
        touchpad = {
            natural_scroll = true,
            middle_button_emulation = true,
            tap_to_click = true,
            tap_and_drag = true
        }
    },
    quirks = {
        -- Report HDR mode as preferred. 0 - off, 1 - always, 2 - gamescope only --
        prefer_hdr = 2
    },

    misc = {
        focus_on_activate = true,
        -- if enabled, windows will open on the workspace they were invoked on. 0 - disabled, 1 - single-shot, 2 - persistent (all children too) --
        initial_workspace_tracking = 1,
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },
})
