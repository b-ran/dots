#
#  Hotkey Daemon
#  Enable with "skhd.enable = true;"
#

{ config, lib, pkgs, ... }:

with lib;
{
  options.skhd = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Simple Hotkey Daemon for MacOS
      '';
    };
  };

  config = mkIf config.skhd.enable {
    services = {
      skhd = {
        enable = true;
        package = pkgs.skhd;
        skhdConfig = ''
          # Shortcuts
          alt - l : pmset displaysleepnow
          alt + shift - s : open -a "Screenshot"
          alt - s : screencapture -ci
          alt - e : open -a "Pika"

          alt - return : open -a "Alacritty" -n
          alt - d : open -a "Raycast"
          alt + shift - f : open -a "Firefox Developer Edition" -n
          alt + shift - g : open -a "Google Chrome" -n
          alt + shift - s : open -a "Slack"
          alt + shift - ? : open -a "Finder"

          # Toggle Window
          alt - q : yabai -m window --toggle float && yabai -m window --grid 4:4:1:1:2:2
          alt - f : yabai -m window --toggle zoom-fullscreen
          alt - c : yabai -m window --close
          alt - m : yabai -m window --toggle split

          # Focus Window
          alt - up : yabai -m window --focus north
          alt - down : yabai -m window --focus south
          alt - left : yabai -m window --focus west
          alt - right : yabai -m window --focus east

          # Swap  Window
          alt + shift - h : yabai -m window --swap north
          alt + shift - j : yabai -m window --swap east
          alt + shift - k : yabai -m window --swap south
          alt + shift - l : yabai -m window --swap west

          # Resize Window
          alt + cmd - left : yabai -m window --resize left:-50:0 && yabai -m window --resize right:-50:0
          alt + cmd - right : yabai -m window --resize left:50:0 && yabai -m window --resize right:50:0
          alt + cmd - up : yabai -m window --resize up:-50:0 && yabai -m window --resize down:-50:0
          alt + cmd - down : yabai -m window --resize up:-50:0 && yabai -m window --resize down:-50:0

          # Focus Space
          alt - 1 : yabai -m space --focus 1
          alt - 2 : yabai -m space --focus 2
          alt - 3 : yabai -m space --focus 3
          alt - 4 : yabai -m space --focus 4
          alt - 5 : yabai -m space --focus 5
          alt - left : yabai -m space --focus prev
          alt - right : yabai -m space --focus next

          # Send to Space
          alt + shift - 1 : yabai -m window --space 1
          alt + shift - 2 : yabai -m window --space 2
          alt + shift - 3 : yabai -m window --space 3
          alt + shift - 4 : yabai -m window --space 4
          alt + shift - 5 : yabai -m window --space 5
        '';
      };
#        skhdConfig = ''
#          # Shortcuts
#          alt - l : pmset displaysleepnow
#          alt + shift - s : open -a "Screenshot"
#          alt - s : screencapture -ci
#          alt - e : open -a "Pika"
#
#          alt - return : open -a "Alacritty" -n
#          alt - d : open -a "Raycast"
#          alt + shift - f : open -a "Firefox Developer Edition" -n
#          alt + shift - g : open -a "Google Chrome" -n
#          alt + shift - s : open -a "Slack"
#          alt + shift - ? : open -a "Finder"
#
#          # Toggle Window
#          alt - q : yabai -m window --toggle float && yabai -m window --grid 4:4:1:1:2:2
#          alt - f : yabai -m window --toggle zoom-fullscreen
#          alt - c : yabai -m window --close
#          alt - m : yabai -m window --toggle split
#
#          # Focus Window
#          alt - up : yabai -m window --focus north
#          alt - down : yabai -m window --focus south
#          alt - left : yabai -m window --focus west
#          alt - right : yabai -m window --focus east
#
#          # Swap  Window
#          alt + shift - h : yabai -m window --swap north
#          alt + shift - j : yabai -m window --swap east
#          alt + shift - k : yabai -m window --swap south
#          alt + shift - l : yabai -m window --swap west
#
#          # Resize Window
#          alt + cmd - left : yabai -m window --resize left:-50:0 && yabai -m window --resize right:-50:0
#          alt + cmd - right : yabai -m window --resize left:50:0 && yabai -m window --resize right:50:0
#          alt + cmd - up : yabai -m window --resize up:-50:0 && yabai -m window --resize down:-50:0
#          alt + cmd - down : yabai -m window --resize up:-50:0 && yabai -m window --resize down:-50:0
#
#          # Focus Space
#          alt - 1 : yabai -m space --focus 1
#          alt - 2 : yabai -m space --focus 2
#          alt - 3 : yabai -m space --focus 3
#          alt - 4 : yabai -m space --focus 4
#          alt - 5 : yabai -m space --focus 5
#          alt - left : yabai -m space --focus prev
#          alt - right : yabai -m space --focus next
#
#          # Send to Space
#          alt + shift - 1 : yabai -m window --space 1
#          alt + shift - 2 : yabai -m window --space 2
#          alt + shift - 3 : yabai -m window --space 3
#          alt + shift - 4 : yabai -m window --space 4
#          alt + shift - 5 : yabai -m window --space 5
#        '';
#      };
    };

    system = {
      keyboard = {
        enableKeyMapping = true;
      };
    };
  };
}