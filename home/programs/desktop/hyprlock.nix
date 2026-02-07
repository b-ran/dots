{ config, lib, user, ... }:

with config.lib.stylix.colors;
{
  programs.hyprlock = { 
    enable = true;
    settings = lib.mkForce {

      general = {
        ignore_empty_input = true;
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      label = [ 
        {
          text = "cmd[update:1000] echo \"<span>$(date +'%I:%M')</span>\"";
          color = "rgba(216, 222, 233, 0.80)";
          font_size = 60;
          font_family =  "JetBrains Mono Nerd Font";
          position = "50, 400";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:1000] echo -e \"$(date +'%A, %B %d')\"";
          color = "rgba(216, 222, 233, 0.80)";
          font_size = 19;
          font_family = "JetBrains Mono Nerd Font";
          position = "55, 340";
          halign = "center";
          valign = "center";
        }
      ];

      background = {
          path = "/home/${user}/.config/lock-wallpaper";
          blur_passes = 0;
          contrast = 0.8916;
          brightness = 0.8916;
          vibrancy = 0.8916;
          vibrancy_darkness = 0.0;
      };

      input-field = {
        size = "320, 55";
        outline_thickness = 0;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(255, 255, 255, 0)";
        inner_color = "rgba(255, 255, 255, 0.1)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "JetBrains Mono Nerd Font";
        placeholder_text = "<i><span foreground=\"##ffffff99\">   Enter Pass</span></i>";
        hide_input = false;
        position = "34, -268";
        halign = "center";
        valign = "center";
      };
    };
  };
}
