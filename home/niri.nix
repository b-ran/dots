{
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
  ];

  programs.niri = {
    enable = true;
    config = ''
      spawn-at-startup "waybar"
      spawn-sh-at-startup "1password --silent"

      binds {
        Mod+Shift+Escape { show-hotkey-overlay; }


        Mod+Return hotkey-overlay-title="Open Terminal" { spawn "alacritty"; }
        Mod+D hotkey-overlay-title="Open App Launcher" { spawn-sh "rofi -show drun -theme ~/.config/rofi/themes/drun.rasi"; }
        Mod+N hotkey-overlay-title="Open Network Manager" { spawn "networkmanager_dmenu"; }
        Mod+B hotkey-overlay-title="Open Background Selector" { spawn "~/.config/rofi/menus/background-select.sh"; }
        Mod+X hotkey-overlay-title="Open Power Menu" { spawn "~/.config/rofi/menus/power.sh"; }
        Mod+L hotkey-overlay-title="Lock Screen" { spawn "hyprlock"; }
        Mod+R hotkey-overlay-title="Record Screen" { spawn "wl-record"; }
        Mod+O hotkey-overlay-title="OCR Capture Screen" { spawn-sh "temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze save area $temp | tesseract - - | wl-copy && notify-send -i \"$temp\" \"OCR:\" \"Text has been copied to the clipboard.\" && rm \"$temp\""; }

        MOD+C { close-window; }

        MOD+Q       { center-column; }
        MOD+CTRL+Q  { center-visible-columns; }

        MOD+T { toggle-window-floating; }
        MOD+F { fullscreen-window; }
        MOD+M { maximize-column; }

        Mod+S       { screenshot; }
        Mod+Shift+S { screenshot-screen write-to-disk=true; }
        Mod+Ctrl+S  { screenshot-window write-to-disk=true; }

        Mod+Left  { focus-column-or-monitor-left; }
        Mod+Down  { focus-window-or-workspace-down; }
        Mod+Up    { focus-window-or-workspace-up; }
        Mod+Right { focus-column-or-monitor-right; }

        Mod+Ctrl+Left  { move-column-left-or-to-monitor-left; }
        Mod+Ctrl+Down  { move-window-down-or-to-workspace-down; }
        Mod+Ctrl+Up    { move-window-up-or-to-workspace-up; }
        Mod+Ctrl+Right { move-column-right-or-to-monitor-right; }

        MOD+SHIFT+HOME  { move-column-to-first; }
        MOD+SHIFT+END   { move-column-to-last; }

        MOD+HOME  { focus-column-first; }
        MOD+END   { focus-column-last; }

        MOD+TAB { focus-workspace-previous; }

        MOD+ESCAPE hotkey-overlay-title="Open Overview" repeat=false { toggle-overview; }

        MOD+WHEELSCROLLDOWN cooldown-ms=100 { focus-workspace-down; }
        MOD+WHEELSCROLLUP   cooldown-ms=100 { focus-workspace-up; }

        MOD+SHIFT+WHEELSCROLLDOWN cooldown-ms=100 { move-column-to-workspace-down; }
        MOD+SHIFT+WHEELSCROLLUP   cooldown-ms=100 { move-column-to-workspace-up; }

        MOD+WHEELSCROLLRIGHT      { focus-column-right; }
        MOD+WHEELSCROLLLEFT       { focus-column-left; }
        MOD+CTRL+WHEELSCROLLRIGHT { move-column-right; }
        MOD+CTRL+WHEELSCROLLLEFT  { move-column-left; }

        MOD+1 { focus-workspace 1; }
        MOD+2 { focus-workspace 2; }
        MOD+3 { focus-workspace 3; }
        MOD+4 { focus-workspace 4; }
        MOD+5 { focus-workspace 5; }
        MOD+6 { focus-workspace 6; }
        MOD+7 { focus-workspace 7; }
        MOD+8 { focus-workspace 8; }
        MOD+9 { focus-workspace 9; }

        MOD+SHIFT+1 { move-column-to-workspace 1; }
        MOD+SHIFT+2 { move-column-to-workspace 2; }
        MOD+SHIFT+3 { move-column-to-workspace 3; }
        MOD+SHIFT+4 { move-column-to-workspace 4; }
        MOD+SHIFT+5 { move-column-to-workspace 5; }
        MOD+SHIFT+6 { move-column-to-workspace 6; }
        MOD+SHIFT+7 { move-column-to-workspace 7; }
        MOD+SHIFT+8 { move-column-to-workspace 8; }
        MOD+SHIFT+9 { move-column-to-workspace 9; }


        MOD+BRACKETLEFT { set-column-width "-10%"; }
        MOD+BRACKETRIGHT { set-column-width "+10%"; }
        MOD+SHIFT+BRACKETLEFT { set-window-height "-10%"; }
        MOD+SHIFT+BRACKETRIGHT { set-window-height "+10%"; }

        MOD+CTRL+WHEELSCROLLDOWN { set-window-height "-5%"; }
        MOD+CTRL+WHEELSCROLLUP { set-window-height "+5%"; }
        

      }

      prefer-no-csd

      screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

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

      input {
        keyboard {
            xkb {
              layout "us"
            }
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

      cursor {
        hide-after-inactive-ms 1000
        hide-when-typing
      }

      xwayland-satellite {
        path "xwayland-satellite"
      }

      overview {
        zoom 0.5
        backdrop-color "#262626"
        workspace-shadow {
          softness 40
          spread 10
          offset x=0 y=10
          color "#00000050"
        }
      }

      gestures {
        dnd-edge-view-scroll {
          trigger-width 30
          delay-ms 100
          max-speed 1500
        }

        dnd-edge-workspace-switch {
          trigger-height 50
          delay-ms 100
          max-speed 1500
        }
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
        match title=r#".*File.*"#
        open-floating true
        default-column-width { proportion 0.0; }
        max-width 800
        max-height 1000
      }

      window-rule {
        match app-id=r#"org\.gtk\.FileChooserDialog"#
        open-floating true
        default-column-width { proportion 0.0; }
        max-width 800
        max-height 1000
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
          match app-id=r#"org\.keepassxc\.KeePassXC"#
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

      // Global window appearance
      window-rule {
          geometry-corner-radius 0
          clip-to-geometry true
      }

      // Inactive window transparency
      window-rule {
          match is-active=false
          opacity 0.9
      }

      layout {
        gaps 0
        center-focused-column "on-overflow"
        background-color "transparent"

        preset-column-widths {
          proportion 0.33333
          proportion 0.5
          proportion 0.66667
        }

        focus-ring {
          width 0
          active-color "#1E1E2E"
        }

        insert-hint {
          off
          color "#1E1E2E"
        }

        struts {}
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
    '';
  };
}
