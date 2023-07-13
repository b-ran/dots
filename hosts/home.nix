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

      #build
      gcc
      gnumake
      openssl
      zlib
      libffi
      readline
      sqlite
      xz
      bzip2

      #dev
      python311
#      python310
#      python39
#      python38

      # sound
      pavucontrol

    ];
  };



}
