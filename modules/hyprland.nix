{ inputs, pkgs, config, home-manager, user, ... }:

let
  wl-record = (pkgs.callPackage ../pkgs/wl-record { });
in
with config.lib.stylix.colors;
{
  programs = {
    xwayland.enable = true;
    hyprland = {
      enable = true;
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
    cliphist
    xwaylandvideobridge
    tesseract
    wf-recorder
    wl-record
  ];

  home-manager.users.${user} = {

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;

      extraConfig = ''
        source=~/.config/hypr/monitors.conf

        env = HYPRCURSOR_THEME,rose-pine-hyprcursor

        env = LIBVA_DRIVER_NAME,nvidia
        env = XDG_SESSION_TYPE,x11
        env = WLR_NO_HARDWARE_CURSORS,1
        env = XDG_SESSION_DESKTOP,Hyprland
        env = QT_QPA_PLATFORM=wayland
        env = BROWSER,firefox-developer-edition
        env = MOZ_ENABLE_WAYLAND,1
        env = _JAVA_AWT_WM_NONREPARENTING,1

        exec-once = waybar
        exec-once = swayidle -w timeout 10 'if pgrep -x hyprlock; then hyprctl dispatch dpms off; fi' resume 'hyprctl dispatch dpms on'
        exec-once = nm-applet
        exec-once = discord --start-minimized
        exec-once = ${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1
        exec-once = 1password --silent
        exec-once = swww query || swww-daemon
        exec-once = wl-paste --watch cliphist store
        exec-once = playerctld daemon

        # windowrulev2 = workspace 7, title:Spotify
        # windowrulev2 = workspace 4, class:jetbrains-idea
        # windowrulev2 = workspace 3, class:discord

        windowrulev2 = noinitialfocus, class:^jetbrains-(?!toolbox), floating:1
        windowrulev2 = workspace special silent, title:^(Firefox).*\s(Sharing Indicator)$
        windowrulev2 = float, class:1Password
        windowrulev2 = center, class:1Password
        windowrulev2 = float, class:org.kde.polkit-kde-authentication-agent-1
        windowrulev2 = center, class:org.kde.polkit-kde-authentication-agent-1

        windowrulev2 = opacity 0.0 override,class:^(xwaylandvideobridge)$
        windowrulev2 = noanim,class:^(xwaylandvideobridge)$
        windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
        windowrulev2 = maxsize 1 1,class:^(xwaylandvideobridge)$
        windowrulev2 = noblur,class:^(xwaylandvideobridge)$pipewire

        layerrule = unset, rofi
        layerrule = blur, rofi
        layerrule = ignorezero, rofi

        $mod = SUPER

        bind = $mod, F, fullscreen,
        # bind = SUPER_SHIFT, F, togglefloating,
        # bind = $mod CTRL, F, exec, hyprctl dispatch workspaceopt allfloat
        bind = $mod, P, pseudo,
        bind = $mod, G, togglegroup,b
        bind = $mod, H, togglesplit
        bind = $mod, C, killactive,

        bind = $mod, B, exec, ~/.config/rofi/menus/background-select.sh
        bind = $mod, N, exec, networkmanager_dmenu
        bind = $mod, D, exec, rofi -show drun -theme ~/.config/rofi/themes/dual.rasi
        bind = $mod, A, exec, rofi -show filebrowser -theme ~/.config/rofi/themes/dual.rasi
        bind = $mod, Q, exec, rofi -show run -theme ~/.config/rofi/themes/dual.rasi
        bind = $mod, W, exec, ~/.config/rofi/menus/windows.sh
        bind = $mod, V, exec, ~/.config/rofi/menus/clipboard.sh
        bind = $mod, X, exec, ~/.config/rofi/menus/power.sh
        bind = $mod, Y, exec, ~/.config/rofi/menus/waybar.sh
        bind = $mod SHIFT, S, exec, ~/.config/rofi/menus/screenshot.sh

        bind = $mod, Return, exec, alacritty

        bind = $mod, S, exec, temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze copysave area $temp  && notify-send -i "$temp" "Screenshot:" "Captured selected area" && rm "$temp"
        bind = $mod, R, exec, wl-record
        bind = $mod, E, exec, color=$(hyprpicker -nar) && convert -size 100x100 xc:"$color" /tmp/color_notification.png && notify-send "Picked Color:" "$color" -i /tmp/color_notification.png
        bind = $mod, L, exec, pamixer --mute & amixer set Capture nocap & playerctl pause & hyprlock && pamixer --unmute && amixer set Capture cap
        bind = $mod, O, exec, temp=$(mktemp /tmp/XXXXXX.png) && grimblast --freeze save area $temp | tesseract - - | wl-copy && notify-send -i "$temp" "OCR:" "Text has been copied to the clipboard." && rm "$temp"

        bind = $mod SHIFT, C, exec, dunstctl close-all
        bind = $mod SHIFT, P, exec, dunstctl history-pop

        # Move focus with mod + arrow keys
        bind = $mod, left, movefocus, l
        bind = $mod, right, movefocus, r
        bind = $mod, up, movefocus, u
        bind = $mod, down, movefocus, d

        # Move windows with mod + SHIFT + arrow keys
        bind = $mod SHIFT, left, movewindow, l
        bind = $mod SHIFT, right, movewindow, r
        bind = $mod SHIFT, up, movewindow, u
        bind = $mod SHIFT, down, movewindow, d

        bind = $mod, tab, togglespecialworkspace
        bind = $mod, minus, movetoworkspacesilent, special
        bind = $mod, escape, movetoworkspace, m+0

        # Move workspace with mod + SHIFT + arrow keys
        bind = $mod alt, right, workspace, m+1
        bind = $mod alt, left, workspace, m-1

        # Scroll through existing workspaces with mod + scroll
        bind = $mod, mouse_down, workspace, m+1
        bind = $mod, mouse_up, workspace, m-1

        # Switch workspaces with mod + [0-9]
        bind = $mod, 1, workspace, 1
        bind = $mod, 2, workspace, 2
        bind = $mod, 3, workspace, 3
        bind = $mod, 4, workspace, 4
        bind = $mod, 5, workspace, 5
        bind = $mod, 6, workspace, 6
        bind = $mod, 7, workspace, 7
        bind = $mod, 8, workspace, 8
        bind = $mod, 9, workspace, 9
        bind = $mod, 0, workspace, 10

        # Move active window to a workspace with mod + SHIFT + [0-9]
        bind = $mod SHIFT, 1, movetoworkspace, 1
        bind = $mod SHIFT, 2, movetoworkspace, 2
        bind = $mod SHIFT, 3, movetoworkspace, 3
        bind = $mod SHIFT, 4, movetoworkspace, 4
        bind = $mod SHIFT, 5, movetoworkspace, 5
        bind = $mod SHIFT, 6, movetoworkspace, 6
        bind = $mod SHIFT, 7, movetoworkspace, 7
        bind = $mod SHIFT, 8, movetoworkspace, 8
        bind = $mod SHIFT, 9, movetoworkspace, 9
        bind = $mod SHIFT, 0, movetoworkspace, 10

        # Move/resize windows with mod + LMB/RMB and dragging
        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow

        # Function keys
        binde = ,XF86AudioRaiseVolume,exec,pamixer -i 5 && notify-send -t 1000 " Audio" "$(pamixer --get-volume-human)" --hint="int:value:$(pamixer --get-volume)"
        binde = ,XF86AudioLowerVolume,exec,pamixer -d 5 && notify-send -t 1000 " Audio" "$(pamixer --get-volume-human)" --hint="int:value:$(pamixer --get-volume)"
        bind = ,XF86AudioMute,exec,pamixer -t && notify-send -t 1000 "ﱝ Audio" "Muted"

        bind =, XF86AudioPlay,exec,playerctl play-pause && notify-send -t 1000 "󰐎 Audio" "$(playerctl metadata artist) - $(playerctl metadata title)"
        bind = ,XF86AudioNext,exec,playerctl next
        bind = ,XF86AudioPrev,exec,playerctl previous

        binde = ,XF86MonBrightnessUp,exec,brightnessctl s +5% && notify-send -t 1000 " Brightness" "$(light)%" --hint="int:value:$(light)"
        binde = ,XF86MonBrightnessDown,exec,brightnessctl s 5%- && notify-send -t 1000 " Brightness" "$(light)%" --hint="int:value:$(light)"

        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
          follow_mouse = 1
          repeat_delay = 300
          repeat_rate = 50

          touchpad {
            middle_button_emulation = true
            tap-to-click = true
            tap-and-drag = true
          }
        }

        general {
          cursor_inactive_timeout = 10
          gaps_in = 5
          gaps_out = 10
          border_size = 2
          col.active_border = rgb(${base0D})
          col.inactive_border = rgb(${base03})

          layout = dwindle
        }

        decoration {
          rounding = 10

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
        }

        animations {
          enabled = yes
        }

        gestures {
          workspace_swipe = true
        }

        dwindle {
          pseudotile = true
          preserve_split = true
        }

        master {
          new_is_master = true
        }

        xwayland {
          force_zero_scaling = true
        }

        misc {
          force_default_wallpaper = 0
          disable_hyprland_logo = true
          disable_splash_rendering = true
        }
      '';
    };
  };
}
