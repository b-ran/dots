{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };
#
#      systemd-boot = {
#        enable = true; # Enable systemd-boot
#      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };

#    plymouth = {
#      enable = true;
#      themePackages = [ pkgs.adi1090x-plymouth-themes ];
#      theme = "bgrt";
#    };
  };
}
