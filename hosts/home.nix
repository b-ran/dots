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
      "application/jpeg" = "feh.desktop";
      "application/png" = "feh.desktop";
      "application/gif" = "feh.desktop";
      "application/x-bittorrent" = "transmission-gtk.desktop";
      "application/x-bittorrent;x-scheme-handler/magnet" = "transmission-gtk.desktop";
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
