-- Chat apps — auto-move to special chat workspace, focus on activate, hide from screen share
hl.window_rule({
    match = {
        class = "^(Slack)$"
    },
    workspace = "special:chat"
})
hl.window_rule({
    match = {
        class = "^(Slack)$"
    },
    focus_on_activate = true,
    no_screen_share = true
})
hl.window_rule({
    match = {
        class = "^(discord)$"
    },
    workspace = "special:chat"
})
hl.window_rule({
    match = {
        class = "^(discord)$"
    },
    focus_on_activate = true,
    no_screen_share = true
})
hl.window_rule({
    match = {
        class = "^(electron)$",
        title = ".*Microsoft Teams$"
    },
    workspace = "special:chat"
})
hl.window_rule({
    match = {
        class = "^(electron)$",
        title = ".*Microsoft Teams$"
    },
    focus_on_activate = true,
    no_screen_share = true
})
hl.window_rule({
    match = {
        class = "^(electron)$",
        initial_title = "^WebCord$"
    },
    workspace = "special:chat"
})
hl.window_rule({
    match = {
        class = "^(electron)$",
        initial_title = "^WebCord$"
    },
    focus_on_activate = true,
    no_screen_share = true
})

-- Firefox -- 
hl.on("window.open", function(w)
    if w.class == "firefox" then
        local ws = hl.get_active_workspace()
        hl.dispatch(hl.dsp.window.move({
            window = w,
            workspace = ws.id
        }))
    end
end)

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

hl.window_rule({
    name = "firefox-pip-float",
    match = {
        class = "firefox$",
        title = "^Picture-in-Picture$"
    },
    float = true,
    center = true,
    pin = true
})

hl.window_rule({
    name = "code-extlink-float",
    match = {
        class = "code",
        title = "Warning: Opening link in external app"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "file-dialogs-float",
    match = {
        title = ".*(Open|Save|Select).*"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "nautilus-float",
    match = {
        class = "org.gnome.Nautilus"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "firefox-google-signin-float",
    match = {
        title = ".*Sign in - Google Accounts — Mozilla Firefox"
    },
    focus_on_activate = true,
    float = true,
    center = true
})

hl.window_rule({
    name = "nm-editor-float",
    match = {
        class = "nm-connection-editor"
    },
    focus_on_activate = true,
    float = true,
    center = true
})

hl.window_rule({
    name = "blueman-float",
    match = {
        class = "blueman-manager"
    },
    focus_on_activate = true,
    float = true,
    center = true
})

hl.window_rule({
    name = "pavucontrol-float",
    match = {
        class = "pavucontrol"
    },
    focus_on_activate = true,
    float = true,
    center = true
})

hl.window_rule({
    name = "1password-float",
    match = {
        class = "1password"
    },
    float = true,
    focus_on_activate = true,
    no_screen_share = true,
    center = true
})

hl.window_rule({
    name = "keepassxc-float",
    match = {
        class = "org.keepassxc.KeePassXC"
    },
    float = true,
    focus_on_activate = true,
    no_screen_share = true,
    center = true
})

hl.window_rule({
    name = "steam-dialogs-float",
    match = {
        class = "steam",
        title = ".*(Friends|Settings|Properties).*"
    },
    float = true
})
