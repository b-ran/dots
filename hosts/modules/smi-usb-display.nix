{ config, pkgs, lib, ... }:

let
  smi-usb-display = pkgs.callPackage ../../pkgs/smi-usb-display { };
in
{
  # EVDI kernel module required by the SMI USB display driver
  boot.extraModulePackages = [ config.boot.kernelPackages.evdi ];
  boot.kernelModules = [ "evdi" ];
  boot.extraModprobeConfig = ''
    options evdi initial_device_count=4
  '';

  environment.systemPackages = [ smi-usb-display ];

  # Udev rules: start/stop the service on device plug/unplug
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", \
      ATTR{idVendor}=="090c", IMPORT{builtin}="usb_id", \
      ATTR{bDeviceClass}=="ef", \
      ENV{SMIUSBDISPLAY_DEVNAME}="$env{DEVNAME}", \
      ENV{SMIUSBDISPLAY_DEVICE_ID}="$env{ID_BUS}-$env{BUSNUM}-$env{DEVNUM}-$env{ID_SERIAL}", \
      RUN+="${smi-usb-display}/lib/smi-usb-display/smi-udev.sh add $root $env{SMIUSBDISPLAY_DEVICE_ID} $env{SMIUSBDISPLAY_DEVNAME}"

    ACTION=="remove", ENV{DEVNAME}!="", \
      ENV{PRODUCT}=="90c/*", \
      RUN+="${smi-usb-display}/lib/smi-usb-display/smi-udev.sh remove $root $env{DEVNAME}"
  '';

  systemd.services.smiusbdisplay = {
    description = "Silicon Motion USB Display Service";
    after = [ "display-manager.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStartPre = "${pkgs.kmod}/bin/modprobe evdi";
      ExecStart = "${smi-usb-display}/bin/SMIUSBDisplayManager";
      WorkingDirectory = "${smi-usb-display}/lib/smi-usb-display";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
