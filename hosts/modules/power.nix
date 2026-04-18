{
  pkgs,
  ...
}:
{
  powerManagement.powertop.enable = true;
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
