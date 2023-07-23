{ pkgs, home-manager, hyprland, hyprland-contrib, user,  ... }:

let
  catppuccinHyprland = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprland";
    rev = "99a88fd21fac270bd999d4a26cf0f4a4222c58be";
    sha256 = "sha256-07B5QmQmsUKYf38oWU3+2C6KO4JvinuTwmW1Pfk8CT8=";
  };
in
{
  security.polkit.enable = true;
  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprpicker
    hyprpaper
    wl-clipboard
    hyprland-contrib.packages.${pkgs.system}.grimblast
    polkit-kde-agent
    webcord-vencord
  ];

  home-manager.users.${user} = {
    home.file.".config/hypr/catppuccin.conf".source = "${catppuccinHyprland}/themes/mocha.conf";
    wayland.windowManager.hyprland = {
      enable = true;
      nvidiaPatches = true;
      systemdIntegration = true;
      recommendedEnvironment = true;

      extraConfig = ''
        source=~/.config/hypr/catppuccin.conf

        env = LIBVA_DRIVER_NAME,nvidia
        env = XDG_SESSION_TYPE,wayland
        env = WLR_NO_HARDWARE_CURSORS,1
        env = XDG_SESSION_DESKTOP,Hyprland
        env = QT_QPA_PLATFORM=wayland
        env = BROWSER,firefox
        env = MOZ_ENABLE_WAYLAND,1

        monitor = ,preferred,auto,1
        monitor = DP-1, 3840x2160@144, 0x0, 1
        monitor = HDMI-A-1, 2560x1440@75, 3840x360, 1

        exec-once = waybar
        exec-once = swayidle -w timeout 10 'if pgrep -x swaylock; then hyprctl dispatch dpms off; fi' resume 'hyprctl dispatch dpms on'
        # exec-once = discord-krisp-patch & discord --start-minimized
        exec-once=${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1

        windowrulev2 = noinitialfocus, class:^jetbrains-(?!toolbox), floating:1
        windowrulev2 = workspace 7, title:Spotify
        windowrulev2 = opacity 0.90 override 0.90 override, title:Spotify
        windowrulev2 = workspace 3, class:jetbrains-idea
        windowrulev2 = workspace 5, class:discord
        windowrulev2= workspace special silent, title:^(Firefox).*\s(Sharing Indicator)$

        windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
        windowrulev2 = noanim,class:^(xwaylandvideobridge)$
        windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
        windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$

        # Some default env vars.


        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
          follow_mouse = 1

          touchpad {
            natural_scroll = no
          }
        }

        general {
          cursor_inactive_timeout = 30
          gaps_in = 5
          gaps_out = 10
          border_size = 2
          col.active_border = $sky
          col.inactive_border = $base

          layout = dwindle
        }

        decoration {
          rounding = 10
          blur = yes
          blur_size = 3
          blur_passes = 1
          blur_new_optimizations = on

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = $base
          col.shadow_inactive = $base
        }

        animations {
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
        }

        dwindle {
          pseudotile = yes
          preserve_split = yes
        }

        master {
          new_is_master = true
        }

        gestures {
          workspace_swipe = yes
        }

        $mod = SUPER

        bind = $mod, Return, exec, alacritty
        bind = $mod, R, forcerendererreload,
        bind = $mod, C, killactive,
        bind = $mod, E, exec, hyprpicker -nar && notify-send "Color picked and copied to clipboard"
        bind = $mod, D, exec, rofi -combi-modi "drun,Power Menu:~/.config/rofi/menus/powermenu.sh" -show combi -theme ~/.config/rofi/themes/combi.rasi
        bind = $mod, N, exec, networkmanager_dmenu
        bind = $mod, P, pseudo,
        bind = $mod, W, togglesplit,
        bind = $mod, F, fullscreen,
        bind = $mod, Q, togglefloating,
        bind = $mod, L, exec, swaylock
        bind = $mod, S, exec, grimblast --notify copy area
        bind = $mod SHIFT, S, exec, grimblast --notify --freeze copy area

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
        binde=,XF86AudioRaiseVolume,exec,pamixer -i 5 && notify-send -t 1000 " Audio" "$(pamixer --get-volume-human)" --hint="int:value:$(pamixer --get-volume)"
        binde=,XF86AudioLowerVolume,exec,pamixer -d 5 && notify-send -t 1000 " Audio" "$(pamixer --get-volume-human)" --hint="int:value:$(pamixer --get-volume)"
        bind=,XF86AudioMute,exec,pamixer -t && notify-send -t 1000 "ﱝ Audio" "Muted"

        bind=,XF86AudioPlay,exec,playerctl play-pause && notify-send -t 1000 "󰐎 Audio" "$(playerctl metadata artist) - $(playerctl metadata title)"
        bind=,XF86AudioNext,exec,playerctl next
        bind=,XF86AudioPrev,exec,playerctl previous

        binde=,XF86MonBrightnessUp,exec,brightnessctl s +5% && notify-send -t 1000 " Brightness" "$(light)%" --hint="int:value:$(light)"
        binde=,XF86MonBrightnessDown,exec,brightnessctl s 5%- && notify-send -t 1000 " Brightness" "$(light)%" --hint="int:value:$(light)"
      '';
    };
  };
}
