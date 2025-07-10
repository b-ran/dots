{
  inputs,
  pkgs,
  config,
  home-manager,
  user,
  ...
}:

let
  wl-record = (pkgs.callPackage ../pkgs/wl-record { });
in
with config.lib.stylix.colors;
{
  programs = {
    xwayland.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    hyprpicker
    swayidle
    imagemagick
    wl-clipboard
    slurp
    kdePackages.xwaylandvideobridge
    tesseract
    wf-recorder
    wl-record
  ];

  home-manager.users.${user} = {

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;

      settings = {
        source = [ "~/.config/hypr/monitors.conf" ];

        env = [
          "HYPRCURSOR_THEME,rose-pine-hyprcursor"
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,x11"
          "WLR_NO_HARDWARE_CURSORS,1"
          "XDG_SESSION_DESKTOP,Hyprland"
          "QT_QPA_PLATFORM=wayland"
          "BROWSER,firefox-developer-edition"
          "MOZ_ENABLE_WAYLAND,1"
          "_JAVA_AWT_WM_NONREPARENTING,1"
        ];

        "exec-once" = [
          "waybar"
          "swayidle -w timeout 10 'if pgrep -x hyprlock; then hyprctl dispatch dpms off; fi' resume 'hyprctl dispatch dpms on'"
          "nm-applet"
          "uwsm app -- webcord --start-minimized"
          "systemctl --user start hyprpolkitagent"
          "uwsm app -- 1password --silent"
          "uwsm app -- playerctld daemon"
          "sleep 1 && uwsm app -- swww-daemon"
          "ssh-agent"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

        windowrulev2 = [
          "noinitialfocus, class:^jetbrains-(?!toolbox), floating:1"
          "workspace special silent, title:^(Firefox).*\\s(Sharing Indicator)$"
          "float, class:1Password"
          "center, class:1Password"
          "float, class:org.pulseaudio.pavucontrol"
          "center, class:org.pulseaudio.pavucontrol"
          "float, class:org.kde.polkit-kde-authentication-agent-1"
          "center, class:org.kde.polkit-kde-authentication-agent-1"
          "center, class:^(Code)$, title:^(Visual Studio Code)$, floating:1"
          "center, class:^(Electron)$, title:^(Warning: Opening link in external app)$, floating:1"
        ];

        windowrule = [
          "opacity 0.0 override, class:^(xwaylandvideobridge)$"
          "noanim, class:^(xwaylandvideobridge)$"
          "noinitialfocus, class:^(xwaylandvideobridge)$"
          "maxsize 1 1, class:^(xwaylandvideobridge)$"
          "noblur, class:^(xwaylandvideobridge)$"
          "nofocus, class:^(xwaylandvideobridge)$"
          "center, floating:1, class:Xdg-desktop-portal-gtk"
        ];

        layerrule = [
          "unset, rofi"
          "blur, rofi"
          "ignorezero, rofi"
        ];

        "$mod" = "SUPER";

        bind = [
          # Hyprland actions
          "$mod, C, killactive,"
          "$mod, F, fullscreen,"
          "$mod SHIFT, F, togglefloating,"
          "$mod, P, pseudo,"
          "$mod, G, togglegroup,"
          "$mod, H, togglesplit"

          # Rofi menus
          "$mod, B, exec, ~/.config/rofi/menus/background-select.sh"
          "$mod, N, exec, networkmanager_dmenu"
          "$mod, D, exec, rofi -show drun -theme ~/.config/rofi/themes/dual.rasi"
          "$mod, W, exec, ~/.config/rofi/menus/windows.sh"
          "$mod, X, exec, ~/.config/rofi/menus/power.sh"
          "$mod, Y, exec, ~/.config/rofi/menus/waybar.sh"
          "$mod SHIFT, S, exec, ~/.config/rofi/menus/screenshot.sh"

          # Apps
          "$mod, Return, exec, alacritty"

          # Scripts
          "$mod, L, exec, amixer sset Master mute & playerctl pause & hyprlock && amixer sset Master unmute"
          "$mod, S, exec, temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze copysave area $temp  && notify-send -i \"$temp\" \"Screenshot:\" \"Captured selected area\" && rm \"$temp\""
          "$mod, R, exec, wl-record"
          "$mod, E, exec, color=$(hyprpicker -nar) && convert -size 100x100 xc:\"$color\" /tmp/color_notification.png && notify-send \"Picked Color:\" \"$color\" -i /tmp/color_notification.png"
          "$mod, O, exec, temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze save area $temp | tesseract - - | wl-copy && notify-send -i \"$temp\" \"OCR:\" \"Text has been copied to the clipboard.\" && rm \"$temp\""

          # Move focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Move windows
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"

          # Special workspace
          "$mod, tab, togglespecialworkspace"
          "$mod, minus, movetoworkspacesilent, special"
          "$mod, equal, movetoworkspace, m+0"

          # Move to workspace
          "$mod alt, right, workspace, m+1"
          "$mod alt, left, workspace, m-1"
          "$mod, mouse_down, workspace, m+1"
          "$mod, mouse_up, workspace, m-1"

          # Move to the first empty workspace
          "$mod alt, down, workspace, empty"

          # Switch workspaces
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          # Move focus to a workspace
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

          # Function keys
          ",XF86AudioMute,exec,pamixer -t && notify-send -t 1000 \"ﱝ Audio\" \"Muted\""
          ",XF86AudioPlay,exec,playerctl play-pause && notify-send -t 1000 \"󰐎 Audio\" \"$(playerctl metadata artist) - $(playerctl metadata title)\""
          ",XF86AudioNext,exec,playerctl next"
          ",XF86AudioPrev,exec,playerctl previous"
        ];

        binde = [
          ",XF86AudioRaiseVolume,exec,pamixer -i 5 && notify-send -t 1000 \" Audio\" \"$(pamixer --get-volume-human)\" --hint=\"int:value:$(pamixer --get-volume)\""
          ",XF86AudioLowerVolume,exec,pamixer -d 5 && notify-send -t 1000 \" Audio\" \"$(pamixer --get-volume-human)\" --hint=\"int:value:$(pamixer --get-volume)\""
          ",XF86MonBrightnessUp,exec,brightnessctl s +5% && notify-send -t 1000 \" Brightness\" \"$(light)%\" --hint=\"int:value:$(light)\""
          ",XF86MonBrightnessDown,exec,brightnessctl s 5%- && notify-send -t 1000 \" Brightness\" \"$(light)%\" --hint=\"int:value:$(light)\""
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        input = {
          follow_mouse = 1;
          repeat_delay = 300;
          repeat_rate = 50;

          touchpad = {
            middle_button_emulation = true;
            tap-to-click = true;
            tap-and-drag = true;
          };
        };

        cursor = {
          inactive_timeout = 10;
        };

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgb(${base0D})";
          "col.inactive_border" = "rgb(${base03})";
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
        };

        animations = {
          enabled = true;
        };

        gestures = {
          workspace_swipe = true;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        xwayland = {
          force_zero_scaling = true;
        };

        misc = {
          focus_on_activate = true;
          initial_workspace_tracking = 2;
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          disable_hyprland_qtutils_check = true;
        };

        ecosystem = {
          no_update_news = false;
          no_donation_nag = true;
        };
      };
    };
  };
}
