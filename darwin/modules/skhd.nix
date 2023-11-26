#
#  Hotkey Daemon
#  Enable with "skhd.enable = true;"
#

{ config, lib, pkgs, ... }:

with lib;
{
  options.skhd = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Simple Hotkey Daemon for MacOS
      '';
    };
  };

  config = mkIf config.skhd.enable {
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
  };
}
