#
#  Hotkey Daemon
#  Enable with "skhd.enable = true;"
#

{ config, lib, pkgs, ... }:

with lib;
{
  services = {
    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # Menu
        cmd + space : /Applications/Raycast.app/Contents/MacOS/Raycast
      '';
    };
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
    };
  };
}
