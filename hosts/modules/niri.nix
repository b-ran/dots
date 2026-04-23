{
  inputs,
  pkgs,
  config,
  home-manager,
  user,
  ...
}:

let
  wl-record = (pkgs.callPackage ../../pkgs/wl-record { });
in
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  programs = {
    xwayland.enable = true;
    niri.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpicker
    imagemagick
    wl-clip-persist
    slurp
    grim
    tesseract
    wl-record
  ];

  home-manager.users.${user} = {
    programs.niri.settings = {
      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { argv = [ "nm-applet" ]; }
        { argv = [ "wl-clip-persist" "--clipboard" "regular" ]; }
        { argv = [ "webcord" "--start-minimized" ]; }
        { argv = [ "systemctl" "--user" "enable" "--now" "hypridle.service" ]; }
        { argv = [ "1password" "--silent" ]; }
        { argv = [ "playerctld" "daemon" ]; }
        { argv = [ "awww-daemon" ]; }
        { argv = [ "ssh-agent" ]; }
      ];

      environment = {
        XDG_SESSION_TYPE = "wayland";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        BROWSER = "firefox";
        MOZ_ENABLE_WAYLAND = "1";
        MOZ_WEBRENDER = "1";
        _JAVA_AWT_WM_NONREPARENTING = "1";
      };

      binds = {
        # Window management
        "Mod+C".action.close-window = null;
        "Mod+F".action.fullscreen-window = null;
        "Mod+Shift+F".action.toggle-window-floating = null;

        # Rofi menus
        "Mod+D".action.spawn = [ "rofi" "-show" "drun" "-theme" "~/.config/rofi/themes/drun.rasi" ];
        "Mod+N".action.spawn = "networkmanager_dmenu";
        "Mod+B".action.spawn = [ "sh" "-c" "~/.config/rofi/menus/background-select.sh" ];
        "Mod+X".action.spawn = [ "sh" "-c" "~/.config/rofi/menus/power.sh" ];
        "Mod+Shift+S".action.spawn = [ "sh" "-c" "~/.config/rofi/menus/screenshot.sh" ];

        # Apps
        "Mod+Return".action.spawn = "alacritty";

        # Scripts
        "Mod+L".action.spawn = "hyprlock";
        "Mod+S".action.screenshot = null;
        "Mod+R".action.spawn = "wl-record";
        "Mod+E".action.spawn = [
          "sh"
          "-c"
          ''color=$(hyprpicker -nar) && convert -size 100x100 xc:"$color" /tmp/color_notification.png && notify-send "Picked Color:" "$color" -i /tmp/color_notification.png''
        ];
        "Mod+O".action.spawn = [
          "sh"
          "-c"
          ''temp=$(mktemp /tmp/XXXXXX.png) && grim -g "$(slurp)" $temp && tesseract $temp - | wl-copy && notify-send -i "$temp" "OCR:" "Text has been copied to the clipboard." && rm "$temp"''
        ];

        # Focus movement
        "Mod+Left".action.focus-column-left = null;
        "Mod+Right".action.focus-column-right = null;
        "Mod+Up".action.focus-window-up = null;
        "Mod+Down".action.focus-window-down = null;

        # Move windows/columns
        "Mod+Shift+Left".action.move-column-left = null;
        "Mod+Shift+Right".action.move-column-right = null;
        "Mod+Shift+Up".action.move-window-up = null;
        "Mod+Shift+Down".action.move-window-down = null;

        # Switch workspaces (niri uses a vertical workspace stack)
        "Mod+Alt+Right".action.focus-workspace-down = null;
        "Mod+Alt+Left".action.focus-workspace-up = null;
        "Mod+Alt+Down".action.focus-workspace-down = null;
        "Mod+WheelScrollDown".action.focus-workspace-down = null;
        "Mod+WheelScrollUp".action.focus-workspace-up = null;

        # Switch workspaces by number
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+0".action.focus-workspace = 10;

        # Move column to workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;
        "Mod+Shift+0".action.move-column-to-workspace = 10;

        # Media keys
        "XF86AudioMute".action.spawn = [ "sh" "-c" "pamixer -t && notify-send -t 1000 'ﱝ Audio' 'Muted'" ];
        "XF86AudioPlay".action.spawn = [
          "sh"
          "-c"
          ''playerctl play-pause && notify-send -t 1000 "󰐎 Audio" "$(playerctl metadata artist) - $(playerctl metadata title)"''
        ];
        "XF86AudioNext".action.spawn = [ "playerctl" "next" ];
        "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];

        # Volume/brightness (repeating by default)
        "XF86AudioRaiseVolume".action.spawn = [ "pamixer" "-i" "5" ];
        "XF86AudioLowerVolume".action.spawn = [ "pamixer" "-d" "5" ];
        "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "5%+" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];
      };
    };
  };
}
