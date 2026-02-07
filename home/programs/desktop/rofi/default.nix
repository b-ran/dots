{ config, pkgs, ... }:

{
  home = {

    file.".config/rofi/themes/drun.rasi".source = ./themes/drun.rasi;
    file.".config/rofi/themes/powermenu.rasi".source = ./themes/powermenu.rasi;
    file.".config/rofi/themes/select.rasi".source = ./themes/select.rasi;
    file.".config/rofi/themes/single.rasi".source = ./themes/single.rasi;

    file.".config/rofi/menus/background-select.sh" = {
      executable = true;
      source = ./menus/background-select.sh;
    };
    file.".config/rofi/menus/power.sh" = {
      executable = true;
      source = ./menus/power.sh;
    };
    file.".config/rofi/menus/screenshot.sh" = {
      executable = true;
      source = ./menus/screenshot.sh;
    };

    file.".config/networkmanager-dmenu/config.ini".text = ''
      [dmenu]
      dmenu_command = rofi -dmenu -i -theme ~/.config/rofi/themes/single.rasi -theme-str 'entry { placeholder: "Search"; }'
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
    package = pkgs.rofi;
  };
}
