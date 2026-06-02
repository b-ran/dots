-- Environment variables.
--
-- PATH is handled by UWSM via xdg.configFile."uwsm/env" in default.nix
-- (sources home-manager's hm-session-vars.sh, which includes
-- home.sessionPath additions like ~/.local/bin).
hl.config({
    env = { -- Hyprcursor (primary for Wayland / server-side cursor apps)
    "HYPRCURSOR_THEME,rose-pine-hyprcursor", "HYPRCURSOR_SIZE,24",

    -- XCursor fallback (GTK and other legacy cursor apps)
    "XCURSOR_THEME,BreezeX-RosePine-Linux", "XCURSOR_SIZE,24",

    -- System integration (gnome-keyring socket dir in the systemd user runtime)
    "GNOME_KEYRING_CONTROL,/run/user/1000/keyring",

    -- ssh-askpass — explicit path so $PATH doesn't have to resolve it
    "SSH_ASKPASS,/run/current-system/sw/bin/seahorse-ssh-askpass", 

    -- Nvidia support --
    "XDG_SESSION_TYPE,wayland",
    "WLR_NO_HARDWARE_CURSORS,1", 
    "XDG_SESSION_DESKTOP,Hyprland", 
    "QT_QPA_PLATFORM=wayland",
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1", 
    },
})

