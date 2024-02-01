#
#  Tiling Window Manager for MacOS
#  Enable with "yabai.enable = true;"
#

{ config, lib, pkgs, ... }:

with lib;
{
  options.yabai = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Tiling Window Manager for MacOS
      '';
    };
  };

  config = mkIf config.yabai.enable {
    services = {
      yabai = {
        enable = true;
        enableScriptingAddition = true;
        package = pkgs.yabai;
        config = {
          layout = "bsp";
          auto_balance = "off";
          split_ratio = "0.50";
          window_border = "on";
          window_border_width = "2";
          window_placement = "second_child";
          focus_follows_mouse = "autoraise";
          top_padding = "10";
          bottom_padding = "10";
          left_padding = "10";
          right_padding = "10";
          window_gap = "10";
          mouse_follows_focus = "off";
          mouse_modifier = "fn";
          mouse_action1 = "move";
          mouse_action2 = "resize";
        };
        extraConfig = ''
          yabai -m rule --add title='Preferences' manage=off layer=above
          yabai -m rule --add title='^System Settings$' manage=off layer=above
          yabai -m rule --add title='^About' manage=off layer=above
          yabai -m rule --add title='^(Opening)' manage=off layer=above
          yabai -m rule --add title='Library' manage=off layer=above
          yabai -m rule --add app='^System Preferences$' manage=off layer=above
          yabai -m rule --add app='Activity Monitor' manage=off layer=above
          yabai -m rule --add app='Finder' manage=off layer=above
          yabai -m rule --add app='^System Information$' manage=off layer=above

          yabai -m rule --add app='Pika' manage=off layer=above
          yabai -m rule --add app='1Password' manage=off layer=above

          yabai -m rule --add app="IntelliJ IDEA" manage=off
          yabai -m rule --add app="IntelliJ IDEA" title=".*\[(.*)\].*" manage=on
        '';
      };
    };
  };
}