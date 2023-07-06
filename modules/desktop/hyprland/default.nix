{ config, lib, pkgs, host, system, hyprland, ... }:

{

  programs.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
      hidpi = true;
    };

    nvidiaPatches = true;

  };

  xdg.portal = {
    enable = true;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

}
