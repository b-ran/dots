#
#  Hotkey Daemon
#  Enable with "skhd.enable = true;"
#

{ config, lib, pkgs, ... }:

{
  services = {
    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # Menu
        cmd - d : /Applications/Raycast.app/Contents/MacOS/Raycast
      '';
    };
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
    };
  };
}
