# Shared home manager configuration
{ config, lib, pkgs, user, ... }:

{

  programs = {
    home-manager.enable = true;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mimeApps.defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "application/pdf" = "zathura.desktop";

    };
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
