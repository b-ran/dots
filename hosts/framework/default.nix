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

  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';

  #  networking.networkmanager.insertNameservers = [ "1.1.1.1" "1.0.0.1"];
  #  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
}


