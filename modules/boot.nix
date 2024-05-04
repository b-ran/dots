{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        splashImage = null;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };

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
