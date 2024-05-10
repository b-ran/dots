{ lib, pkgs, user, ... }:

{
  imports =
    (import ../home) ++
    (import ../home/services) ++
    (import ../home/programs/apps) ++
    (import ../home/programs/desktop) ++
    (import ../home/programs/cli);

  programs = {
    home-manager.enable = true;
  };

  services = {
    gnome-keyring.enable = true;
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";

    packages = with pkgs; [
      # cli
      nh
      nvd
      nix-output-monitor
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
      awscli2
      kubernetes-helm
      ventoy-full
      kubectx
      kops
      dive
      jq
      zip
      tree
      feh
      wlr-randr
      bfg-repo-cleaner
      distrobox
      killall
      glow
      nix-prefetch-git

      # gui apps
      keepassxc
      remmina
      freerdp
      slack
      ventoy-full
      transmission-gtk
      spotify
      nwg-displays
      gimp
      filezilla
      logseq

      # gnome
      loupe
      gnome.gnome-system-monitor
      gnome.gnome-disk-utility
      gnome.gnome-clocks
      gnome.gnome-calculator
      gnome.nautilus
      gnome.seahorse

      # system
      xdg_utils
      libnotify
      pavucontrol
      playerctl
      brightnessctl
      pamixer
      qt6.qtwayland
      qt6.full
      speechd
      networkmanagerapplet
      networkmanager-openvpn
      openvpn
      polkit-kde-agent
      wl-clipboard

      # dev
      gcc
      gnumake
      postgresql
      nodejs
      yarn
      pkg-config
      cpio
    ];
  };
}
