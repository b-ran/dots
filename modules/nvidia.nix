{ pkgs, config, libs, ... }:

{
  hardware.opengl = {
    enable = true;
#    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;

  hardware.nvidia.package =
   config.boot.kernelPackages.nvidiaPackages.beta;

#  specialisation = {
#    nvidiaBeta.configuration = {
#      hardware.nvidia.package =
#       config.boot.kernelPackages.nvidiaPackages.latest;
#      environment.etc."specialisation".text = "nvidiaLatest";
#    };
#    nvidia535.configuration = {
#      hardware.nvidia.package = let
#      rcu_patch = pkgs.fetchpatch {
#        url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
#        hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
#      };
#      in config.boot.kernelPackages.nvidiaPackages.mkDriver {
#        version = "535.154.05";
#        sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
#        sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
#        openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
#        settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
#        persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
#        patches = [ rcu_patch ];
#      };
#      environment.etc."specialisation".text = "nvidia535";
#    };
#  };
}