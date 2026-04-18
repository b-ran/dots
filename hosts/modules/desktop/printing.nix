{
  services.printing = {
    enable = true;
    cups-pdf = {
      enable = true;
      instances.pdf.settings = {
        Out = "\${HOME}/.local/tmp";
      };
    };
  };
  hardware.sane.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
