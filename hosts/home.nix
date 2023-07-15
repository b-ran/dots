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


    ];
  };



}
