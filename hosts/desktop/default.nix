{ lib, pkgs, home-manager, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules) ++
    [(import ../../modules/gaming.nix)];

  networking.hostName = "nixos";
}
