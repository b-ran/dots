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
        package = pkgs.yabai;
        config = {
          layout = "bsp";
          auto_balance = "off";
          split_ratio = "0.50";
          window_border = "on";
          window_border_width = "2";
          window_border_radius = "11";
          window_border_hidpi = "off";
          active_window_opacity = "1.00";
          normal_window_opacity = "0.95";
          window_opacity_duration = "0.15";
          window_topmost = "off";
          window_shadow = "float";
          window_placement = "second_child";
          window_animation_duration = "0.22";
          focus_follows_mouse = "autoraise";
          mouse_modifier = "fn";
          mouse_follows_focus = "on";
          mouse_drop_action = "swap";
          mouse_action1 = "move";
          mouse_action2 = "resize";
          active_window_border_color = "0xffe1e3e4";
          normal_window_border_color = "0xff2a2f38";
          insert_feedback_color = "0xff9dd274";

          top_padding = "10";
          bottom_padding = "10";
          left_padding = "10";
          right_padding = "10";
          window_gap = "8";
        };
        extraConfig = ''
          yabai -m rule --add app='^Emacs$' manage=on
          yabai -m rule --add title='Preferences' manage=off layer=above
          yabai -m rule --add title='^(Opening)' manage=off layer=above
          yabai -m rule --add title='Library' manage=off layer=above
          yabai -m rule --add app='^System Preferences$' manage=off layer=above
          yabai -m rule --add app='Activity Monitor' manage=off layer=above
          yabai -m rule --add app='Finder' manage=off layer=above
          yabai -m rule --add app='^System Information$' manage=off layer=above
        '';
      };
    };
  };
}