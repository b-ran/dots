{ lib, pkgs, home-manager, user, host, inputs, ... }:

{
  imports =
    [
      (import ./hardware-configuration.nix)
      inputs.nixos-hardware.nixosModules.framework-13-amd-ai-300-series
    ] ++
    (import ../../modules);

  networking.hostName = "framework";
#  networking.networkmanager.insertNameservers = [ "1.1.1.1" "1.0.0.1"];
#  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
}
