{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wlopm
  ];
  
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          ignore_dbus_inhibit = false;
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "wlopm --on '*'";
          lock_cmd = "pidof hyprlock || hyprlock";
          on_lock_cmd = "amixer sset Master mute & playerctl pause";
          on_unlock_cmd = "amixer sset Master unmute";
        };

        listener = [
          {
            timeout = 10;
            on-timeout = "pidof hyprlock && wlopm --off '*'";
            on-resume = "wlopm --on '*'";
          }

          # Set monitor backlight to minimum after 2.5min
          {
            timeout = 150;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }

          # Turn off keyboard backlight after 2.5min
          {
            timeout = 150;
            on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
            on-resume = "brightnessctl -rd rgb:kbd_backlight";
          }

          # Lock screen after 5min
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }

          # Screen off after 5.5min
          {
            timeout = 330;
            on-timeout = "wlopm --off '*'";
            on-resume = "wlopm --on '*' && brightnessctl -r";
          }

          # Suspend after 30min
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
