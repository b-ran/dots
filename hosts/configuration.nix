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


  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  networking = {
    enableIPv6 = false;
    networkmanager.enable = true;
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
    variables = {
      PIP_NO_BINARY = "ruff"; # Don't use prebuilt ruff wheels (they don't work on nixos)
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
  };

  xdg.portal = {
    enable = true;

    config = {
      common = {
        # Use xdg-desktop-portal-gtk for every portal interface...
        default = [
          "gtk"
          "hyprland"
        ];
        # except for the secret portal, which is handled by gnome-keyring
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };

    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
    # xdg-open is used by almost all programs to open a unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
    # and vscode has open like `External Uri Openers`
    xdgOpenUsePortal = true;
    # ls /etc/profiles/per-user/ryan/share/xdg-desktop-portal/portals
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for provides file picker / OpenURI
      # xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland # for Hyprland
    ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
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
    gnome.sushi.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
