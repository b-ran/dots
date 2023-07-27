{ lib, pkgs, home-manager, hyprland, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules);

  networking.hostName = "nixos";
  networking.networkmanager.insertNameservers = ["10.1.0.3"];
  networking.nameservers = [ "10.1.0.3" ];
}
