{ config, pkgs, ... }:

{
  home = {

    file.".config/rofi/themes/dual.rasi".source = ./themes/dual.rasi;
    file.".config/rofi/themes/select.rasi".source = ./themes/select.rasi;
    file.".config/rofi/themes/single.rasi".source = ./themes/single.rasi;
    file.".config/rofi/themes/single-wide.rasi".source = ./themes/single-wide.rasi;


    file.".config/rofi/menus/background-select.sh" = {
      executable = true;
      source = ./menus/background-select.sh;
      onChange = ''
         if [ ! -f ~/.config/current-wallpaper ]; then
            cp ~/wallpapers/astronaut-moonlight-serenity.png ~/.config/current-wallpaper
         fi
      '';
    };
    file.".config/rofi/menus/clipboard.sh" = {
      executable = true;
      source = ./menus/clipboard.sh;
    };
    file.".config/rofi/menus/power.sh" = {
      executable = true;
      source = ./menus/power.sh;
    };
    file.".config/rofi/menus/screenshot.sh" = {
      executable = true;
      source = ./menus/screenshot.sh;
    };
    file.".config/rofi/menus/windows.sh" = {
      executable = true;
      source = ./menus/windows.sh;
    };
    file.".config/rofi/menus/pywal.sh" = {
      executable = true;
      source = ./menus/pywal.sh;
    };
    file.".config/rofi/menus/waybar.sh" = {
      executable = true;
      source = ./menus/waybar.sh;
    };

    file.".config/networkmanager-dmenu/config.ini".text = ''
      [dmenu]
      dmenu_command = rofi -dmenu -i -theme /home/brandon/workspace/nixos-config/home/programs/desktop/rofi/themes/single.rasi -theme-str 'entry { placeholder: "󰈀 Search"; }'
      rofi_highlight = True
      compact = True
      wifi_chars = 󰤟󰤢󰤥󰤨

      [editor]
      terminal = alacritty
      gui_if_available = True
    '';

    packages = with pkgs; [
      dmenu
      networkmanager_dmenu
    ];

  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrainsMono Nerd Font 12";
    plugins = with pkgs; [
      rofi-calc
    ];
  };
}
