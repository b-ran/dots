{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    package = pkgs.greetd.tuigreet;
    restart = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-session";
        user = "greeter"; # NOT a username
      };
    };
  };
  # optional below
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "null"; # no tty spam
    StandardError = "journal"; 
    TTYReset = true; 
    TTYVHangup = true; 
    TTYVTDisallocate = true; 
  };
}