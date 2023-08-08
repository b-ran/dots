{ config, pkgs, old-nixpkgs, user, system, ... }:

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
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {from = 3000; to = 3100;}
        {from = 8000; to = 8100;}
      ];
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";  # Use wayland for electron apps if supported
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
    # Allow wayland to unlock the screen
    pam.services.swaylock.text = "auth include login";
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
    gnome.gnome-keyring.enable = true;
    dbus.packages = [pkgs.gcr]; # Needed for Gnome services
    geoclue2.enable = true; # Allow location services
    localtimed.enable = true; # Set the time from the network
  };

  fonts.packages = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];


}
