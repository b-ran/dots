{ pkgs, config, libs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;

  hardware.nvidia.package =
   config.boot.kernelPackages.nvidiaPackages.beta;
}