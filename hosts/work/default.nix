{ lib, pkgs, home-manager, hyprland, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules);

  networking.hostName = "nixos";
}
