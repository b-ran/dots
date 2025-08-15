{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.displayManager.gdm.enable = true;
}