{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.displayManager.gdm.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

}
