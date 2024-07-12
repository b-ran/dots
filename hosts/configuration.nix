{ config, pkgs, user, system, ... }:

{
  system.stateVersion = "23.11";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };

  networking = {
    enableIPv6 = false;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {from = 2000; to = 3100;}
        {from = 8000; to = 8100;}
      ];
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      FLAKE = "/home/${user}/workspace/dots";
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
    pam.services.login.enableGnomeKeyring = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services = {
    blueman.enable = true;
    udisks2.enable = true;
    dbus.packages = [pkgs.gcr]; # Needed for Gnome services
    geoclue2.enable = true; # Allow location services
    localtimed.enable = true;
    gvfs.enable = true;
    gnome.sushi.enable = true;
  };
}
