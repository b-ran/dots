{ pkgs, lib, user, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    [ (import ../../modules/editors/jetbrains) ] ++
    [ (import ../../modules/hardware/nvidia) ] ++
    [ (import ../../modules/hardware/sound) ] ++
    [ (import ../../modules/boot/efi) ] ++
    [ (import ../../modules/boot/grub) ] ++
    [ (import ../../modules/desktop/hyprland) ];


  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  security.pam.services.swaylock = { };
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  time.timeZone = "Pacific/Auckland";

  environment.systemPackages = with pkgs; [
    feh

    # cli
    wget
    cbonsai
    viddy
    neofetch
    bat
    gtop
    unzip
    ranger
    ncdu
    rsync
    just
    kubectl
    helm
    kubectx
    kops
    dive
    awscli2

    # build
    gcc
    gnumake

    # dev
    python311
    python311Packages.pip
    python310

    # progams
    keepassxc
    remmina
    freerdp
    slack
    ventoy-full
    gparted
    gnome.gnome-system-monitor

    # system
    xdg_utils
    libnotify

    # sound
    pavucontrol

  ];

  fonts.fonts = with pkgs; [
    # Fonts
    carlito # NixOS
    vegur # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome # Icons
    corefonts # MS
    (nerdfonts.override {
      # Nerdfont Icons override
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];
}
