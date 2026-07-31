{
  boot = {
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
    ];
    plymouth.enable = true;
    initrd = {
      systemd = {
        enable = true;
      };
      verbose = false;
    };
    loader = {
      grub = {
        enable = true;
        configurationLimit = 10;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
