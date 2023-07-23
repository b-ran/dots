{ lib, pkgs, home-manager, hyprland, user, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    (import ../../modules);


  networking.hostName = "nixos";

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

    #util
    jq
    playerctl
    brightnessctl
    pamixer
    qt6.qtwayland
    qt6.full
    speechd

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
    transmission-gtk
    spotify

    # system
    xdg_utils
    libnotify

    # sound
    pavucontrol

  ];
}
