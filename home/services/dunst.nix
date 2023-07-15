{
  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          origin = "top-right";
          follow = "mouse";
          font = "JetBrainsMono Nerd Font 12";
          offset = "15x15";
          line_height = 10;
          separator_height = 0;
          gap_size = 10;
          frame_width = 1;
          format = "<b>%s</b>\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = "no";

          enable_recursive_icon_lookup = true;
          icon_theme = "Papirus-Dark";
          min_icon_size = 32;
          max_icon_size = 48;

          mouse_left_click = "close";
          mouse_middle_click = "close_all";
          mouse_right_click = "do_action, close_current";

          frame_color = "#89B4FA";
          separator_color= "rgba(0,0,0,0)";
        };
        experimental = {
          per_monitor_dpi = true;
        };
        urgency_low = {
          timeout = 5;
          background = "#1E1E2E";
          foreground = "#CDD6F4";
        };
        urgency_normal = {
          timeout = 5;
          background = "#1E1E2E";
          foreground = "#CDD6F4";
        };
        urgency_critical = {
          timeout = 5;
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          frame_color = "#FAB387";
        };
      };
    };
  };
}