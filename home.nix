{ config, pkgs, ... }:

{
  home.username = "brandon";
  home.homeDirectory = "/home/brandon";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}