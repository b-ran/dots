{
  services.printing.enable = true;
  hardware.sane.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
