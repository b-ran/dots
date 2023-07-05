{ config, pkgs, inputs, ... }:

{
  boot.loader.efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
  };
}