{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      # Bluetooth settings for wireless controllers
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          AutoEnable = true;
          ControllerMode = "dual";
          Experimental = true;
          KernelExperimental = true;
          FastConnectable = true;
          ReconnectAttempts = 7;
          ReconnectIntervals = "1, 2, 4, 8, 16, 32, 64";
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };

  services = {
    blueman.enable = true;
  };
}
