{ lib, pkgs, home-manager, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules) ++
    [(import ../../modules/piper.nix)];

  networking.hostName = "nixos";
}
