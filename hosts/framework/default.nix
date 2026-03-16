{
  lib,
  pkgs,
  home-manager,
  user,
  host,
  inputs,
  ...
}:

{
  imports = [
    (import ./hardware-configuration.nix)
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ]
  ++ (import ../../modules);

  networking.hostName = "framework";

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  services.xserver.videoDrivers = [
    "displaylink"
    "modesetting"
  ];
  
  networking.networkmanager.insertNameservers = [ "1.1.1.1" "1.0.0.1"];
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
}


