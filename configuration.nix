{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
    };
    grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
    };
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Pacific/Auckland";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.brandon = {
    isNormalUser = true;
    description = "brandon";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
    packages = with pkgs; [
      firefox
    ];
  };


  nixpkgs.config.allowUnfree = true;

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  system.stateVersion = "23.11";
  programs.hyprland.enable = true;
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
# Enabling Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}