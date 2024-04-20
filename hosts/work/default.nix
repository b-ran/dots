{ lib, pkgs, home-manager, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules);

  networking.hostName = "work";
  networking.networkmanager.insertNameservers = [ "10.1.0.3" ];
  networking.nameservers = [ "10.1.0.3" ];
}
