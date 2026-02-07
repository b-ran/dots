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

          # Suspend after 3.5 hours
          {
            timeout = 12600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
