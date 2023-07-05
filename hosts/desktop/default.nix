{ pkgs, lib, ... }:

{
  imports =
    [(import ./hardware-configuration.nix)] ++
    [(import ../../modules/editors/jetbrains)] ++
    [(import ../../modules/hardware/sound)] ++
    [(import ../../modules/hardware/nvidia)] ++
    [(import ../../modules/boot/efi)] ++
    [(import ../../modules/boot/grub)] ++
    [(import ../../modules/desktop/hyprland)];


  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  time.timeZone = "Pacific/Auckland";

  environment.systemPackages = with pkgs; [
    kitty
    firefox-wayland
    wofi
  ];
}
