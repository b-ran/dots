# Shared home manager configuration
{ config, lib, pkgs, user, ... }:

{

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";

    # Shared home packages
    packages = with pkgs; [
      # cli
      wget
      cbonsai
      viddy
      gtop
      unzip
      ranger
      ncdu
      rsync
      just

      # sound
      pavucontrol
    ];
  };



}
