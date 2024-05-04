#{
#  pkgs,
#  config,
#  user,
#  ...
#}:
#
#
#{
#  environment.systemPackages = [
#    (pkgs.sddm-chili-theme.override {
#      themeConfig = {
#        background = "/etc/current-wallpaper";
#        backgroundMode = "none";
#        blur = true;
#        recursiveBlurLoops = 5;
#        recursiveBlurRadius = 15;
#      };
#    })
#  ];
#
#  services.xserver.enable = true;
#  services.displayManager = {
#    sessionPackages = [ config.programs.hyprland.package ];
#    enable = true;
##    autoLogin = {
##      enable = false;
##      user = user;
##    };
##    sddm = {
##      enable = true;
##    };
#
#    sddm = {
#      enable = true;
#      theme = "chili";
#    };
#  };
#}

#{
#  pkgs,
#  inputs,
#  ...
#}: let
#  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
#  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
#in {
#  services.greetd = {
#    enable = true;
#    settings = {
#      default_session = {
#        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
#        user = "greeter";
#      };
#    };
#  };
#
#  # this is a life saver.
#  # literally no documentation about this anywhere.
#  # might be good to write about this...
#  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
#  systemd.services.greetd.serviceConfig = {
#    Type = "idle";
#    StandardInput = "tty";
#    StandardOutput = "tty";
#    StandardError = "journal"; # Without this errors will spam on screen
#    # Without these bootlogs will spam on screen
#    TTYReset = true;
#    TTYVHangup = true;
#    TTYVTDisallocate = true;
#  };
#}

{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      sessionPackages = [ pkgs.hyprland ];
      gdm = {
        enable = true;
      };
    };
  };
}