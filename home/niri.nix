{
  inputs,
  pkgs,
  ...
}:

let
  wl-record = (pkgs.callPackage ../pkgs/wl-record { });
in
{
  home.packages = with pkgs; [
    hyprpicker
    imagemagick
    slurp
    grim
    tesseract
    wl-record
    inputs.ie-r.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.niri = {
    config = ''
      include optional=true "monitor.kdl"
      spawn-at-startup "waybar"
      spawn-at-startup "ie-r"
      spawn-sh-at-startup "1password --silent"

      input {
        keyboard {
            xkb {
              layout "us"
            }
            numlock
        }

        touchpad {
          tap
          natural-scroll
          drag true
          drag-lock
          dwt
        }

        focus-follows-mouse
        workspace-auto-back-and-forth
      }

      layout {
        gaps 0
        background-color "transparent"
        center-focused-column "never"

        preset-column-widths {
          proportion 0.33333
          proportion 0.5
          proportion 0.66667
        }

        default-column-width { 
          proportion 0.5
        }

        focus-ring {
          off
        }

        shadow {
          // off
          softness 30
          spread 5
          offset x=0 y=5
          color "#0007"
        }

        struts {}
      }

      cursor {
        hide-after-inactive-ms 10000
        hide-when-typing
      }

      hotkey-overlay {
        skip-at-startup
      }

      xwayland-satellite {
        path "xwayland-satellite"
      }

      overview {
        zoom 0.75
        backdrop-color "transparent"
      }

      animations {
        workspace-switch {
          spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
        }
        window-open {
          duration-ms 200
          curve "ease-out-quad"
        }
        window-close {
          duration-ms 200
          curve "ease-out-cubic"
        }
        horizontal-view-movement {
          spring damping-ratio=1.0 stiffness=900 epsilon=0.0001
        }
        window-movement {
          spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
        }
        window-resize {
          spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
        }
        config-notification-open-close {
          spring damping-ratio=0.6 stiffness=1200 epsilon=0.001
        }
        screenshot-ui-open {
          duration-ms 300
          curve "ease-out-quad"
        }
        overview-open-close {
          spring damping-ratio=1.0 stiffness=900 epsilon=0.0001
        }
      }

      environment {
        HYPRCURSOR_THEME "rose-pine-hyprcursor"
        HYPRCURSOR_SIZE "24"
        XCURSOR_SIZE "24"
        XDG_SESSION_TYPE "wayland"
        WLR_NO_HARDWARE_CURSORS "1"
        QT_QPA_PLATFORM "wayland"
        QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
        ELECTRON_OZONE_PLATFORM_HINT "auto"
        BROWSER "firefox"
        MOZ_ENABLE_WAYLAND "1"
        MOZ_WEBRENDER "1"
        _JAVA_AWT_WM_NONREPARENTING "1"
      }


      binds {

       // ─── Applications ───
        Mod+Shift+Escape { show-hotkey-overlay; }
        Mod+Return        hotkey-overlay-title="Open Terminal" { spawn "alacritty"; }
        Mod+D             hotkey-overlay-title="Open App Launcher" { spawn-sh "rofi -show drun -theme ~/.config/rofi/themes/drun.rasi"; }
        Mod+N             hotkey-overlay-title="Open Network Manager" { spawn "networkmanager_dmenu"; }
        Mod+B             hotkey-overlay-title="Open Background Selector" { spawn "~/.config/rofi/menus/background-select.sh"; }
        Mod+X             hotkey-overlay-title="Open Power Menu" { spawn "~/.config/rofi/menus/power.sh"; }
        Mod+Alt+L         hotkey-overlay-title="Lock Screen" { spawn "hyprlock"; }
        Mod+R             hotkey-overlay-title="Record Screen" { spawn "wl-record"; }
        Mod+P             hotkey-overlay-title="Open Color Eyedropper"  { spawn-sh "pkill -SIGUSR1 ie-r"; }
        Mod+Shift+P       hotkey-overlay-title="Open Color Eyedropper Settings"  { spawn-sh "pkill -SIGUSR2 ie-r"; }

        Mod+O             hotkey-overlay-title="OCR Capture Screen" { spawn-sh "temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze save area $temp | tesseract - - | wl-copy && notify-send -i \"$temp\" \"OCR:\" \"Text has been copied to the clipboard.\" && rm \"$temp\""; }
        
        // ─── Layout Controls ───
        Mod+T           { toggle-window-floating; }
        Mod+Shift+F     { fullscreen-window; }
        Mod+F           { maximize-column; }
        Mod+E           { expand-column-to-available-width; }
        Mod+Shift+E     { switch-preset-column-width; }
        Mod+Minus       { set-column-width "-10%"; }
        Mod+Equal       { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+M           { power-off-monitors; }

        // ─── Screenshots ───
        Mod+S       { screenshot; }
        Mod+Shift+S { screenshot-screen write-to-disk=true; }
        Mod+Ctrl+S  { screenshot-window write-to-disk=true; }

        // ─── Window Movement and Focus ───
        Mod+C repeat=false { close-window; }

        Mod+Left                             { focus-column-left; }
        Mod+H                                { focus-column-left; }
        Mod+Right                            { focus-column-right; }
        Mod+L                                { focus-column-right; }
        Mod+Up                               { focus-window-up; }
        Mod+K                                { focus-window-up; }
        Mod+Down                             { focus-window-down; }
        Mod+J                                { focus-window-down; }

        Mod+Shift+Left                       { move-column-left; }
        Mod+Shift+H                          { move-column-left; }
        Mod+Shift+Right                      { move-column-right; }
        Mod+Shift+L                          { move-column-right; }
        Mod+Shift+Up                         { move-window-up; }
        Mod+Shift+K                          { move-window-up; }
        Mod+Shift+Down                       { move-window-down; }
        Mod+Shift+J                          { move-window-down; }

        Mod+Home                             { focus-column-first; }
        Mod+End                              { focus-column-last; }
        Mod+Shift+Home                       { move-column-to-first; }
        Mod+Shift+End                        { move-column-to-last; }

        Mod+Alt+Left                         { focus-monitor-left; }
        Mod+Alt+Down                         { focus-monitor-down; }
        Mod+Alt+Up                           { focus-monitor-up; }
        Mod+Alt+Right                        { focus-monitor-right; }

        Mod+Shift+Ctrl+Left                  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down                  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up                    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right                 { move-column-to-monitor-right; }


        // ─── Workspace Switching ───
        Mod+WheelScrollDown       cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp         cooldown-ms=150 { focus-workspace-up; }
        Mod+Shift+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Shift+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+Alt+WheelScrollDown       { focus-column-right; }
        Mod+Alt+WheelScrollUp        { focus-column-left; }
        Mod+Shift+WheelScrollRight { move-column-right; }
        Mod+Shift+WheelScrollLeft  { move-column-left; }

        Mod+Tab repeat=false { toggle-overview; }
        Mod+Space { focus-workspace-previous; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        // ─── FN Keys ───
        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
        XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

        XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
        XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
        XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

        XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }
      }

      window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
      }

      window-rule {
        match app-id=r#"firefox"#
        match app-id=r#"google-chrome"#
        match app-id=r#"code"#
        match app-id=r#"chromium"#
        open-maximized true
      }

      window-rule {
        match app-id=r#"code"# title=r#"Warning: Opening link in external app"#
        open-floating true
      }

      window-rule {
        match title=r#".*(Open|Save|Select).*"#
        open-floating true
        default-column-width { proportion 0.0; }
        max-width 800
        max-height 1000
      }

      window-rule {
        match app-id=r#"org.gnome.Nautilus"#
        open-floating true
        default-column-width { proportion 0.0; }
      }

      window-rule {
        match title=r#".*Sign in - Google Accounts — Mozilla Firefox"#
        open-floating true
      }

      window-rule {
        match app-id="^gimp" title="^GIMP Startup$"
        open-focused false
      }

      // System dialogs
      window-rule {
        match title=r#".*(Dialog|Properties|Preferences|Settings|Rename).*"#
        open-floating true
      }

      // Password managers
        window-rule {
          match app-id=r#"1password"#
          open-floating true
          open-focused true
          block-out-from "screen-capture"
      }

      window-rule {
          match app-id=r#"org.keepassxc.KeePassXC"#
          open-floating true
          open-focused true
          block-out-from "screen-capture"
      }

      // Notification and system utilities
      window-rule {
          match app-id=r#"nm-connection-editor"#
          open-floating true
      }

      window-rule {
          match app-id=r#"blueman-manager"#
          open-floating true
      }

      window-rule {
          match app-id=r#"pavucontrol"#
          open-floating true
      }

      // Steam dialogs
      window-rule {
          match app-id=r#"steam"# title=r#".*(Friends|Settings|Properties).*"#
          open-floating true
      }

      layer-rule {
          match namespace="^awww-daemon$"
          place-within-backdrop true
          opacity 1.0
      }

    '';
  };
}
