{ config, lib, pkgs, ... }:

with config.lib.stylix.colors.withHashtag;
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${pkgs.firefox}/bin/firefox";
        dmenu = "${pkgs.dmenu}/bin/dmenu -p dunst";

        origin = "top-right";
        follow = "mouse";
        offset = "15x15";
        width = 350;
        height = 100;
        
        line_height = 10;
        separator_height = 0;
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 10;
        gap_size = 10;
        
        frame_width = 2;
        corner_radius = 10;
        
        idle_threshold = 15;
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = true;
        show_indicators = "no";

        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus-Dark";
        min_icon_size = 32;
        max_icon_size = 48;
        icon_position = "left";

        mouse_left_click = "close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "do_action, open_url, close_current";

        progress_bar_corner_radius = 5;
      };
      
      experimental = {
        per_monitor_dpi = true;
      };
      
      urgency_low = lib.mkForce {
        timeout = 5;
        background = base00;
        foreground = base05;
        frame_color = base03;
      };
      
      urgency_normal = lib.mkForce {
        timeout = 5;
        background = base00;
        foreground = base05;
        frame_color = base03;
      };
      
      urgency_critical = lib.mkForce {
        timeout = 5;
        background = base00;
        foreground = base05;
        frame_color = base08;
      };
    };
  };
}