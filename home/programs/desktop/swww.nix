{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      swww
    ];

    file."wallpapers".source = ../../../wallpapers;
  };
}