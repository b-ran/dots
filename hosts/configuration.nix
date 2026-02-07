{
  config,
  pkgs,
  user,
  system,
  ...
}:

{
  system.stateVersion = "23.11";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };

  networking = {
    enableIPv6 = false;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 2000;
          to = 3100;
        }
        {
          from = 8000;
          to = 8100;
        }
        {
          from = 5000;
          to = 5200;
        }
      ];
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      NH_FLAKE = "/home/${user}/workspace/dots";
      GOOGLE_CHROME_PATH = "${pkgs.google-chrome}";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = {
    dconf.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock.text = "auth include login"; # Allow wayland to unlock the screen
    pam.services.gdm.enableGnomeKeyring = true;
    pam.services.hyprlock.enableGnomeKeyring = true;
    pam.services.gdm-password.enableGnomeKeyring = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  xdg.portal = {
    enable = true;
  };

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
    udisks2.enable = true;
    dbus.packages = [ pkgs.gcr ]; # Needed for Gnome services
    geoclue2.enable = true; # Allow location services
    localtimed.enable = true;
    gvfs.enable = true;
    gnome.sushi.enable = true; # File previewer for Nautilus
    gnome.gnome-keyring.enable = true;
  };
}
