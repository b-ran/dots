{ lib, pkgs, home-manager, user, host, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules) ++
    [(import ../../modules/gaming.nix)];

  networking.hostName = "desktop";
  networking.networkmanager.insertNameservers = [ "1.1.1.1" "1.0.0.1"];
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
}
