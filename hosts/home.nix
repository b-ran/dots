{ lib, inputs, system, pkgs, user, ... }:

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

  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
    # Configure home manager nixpkgs instance
    config = {
      allowUnfree = true;
    };
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
      gource
      hours
      supabase-cli
      claude-code

      # gui apps
      keepassxc
      remmina
      freerdp
      slack
      transmission_4-gtk
      spotify
      nwg-displays
      gimp
      filezilla
      shotcut
      libsForQt5.kdenlive
      google-chrome
      inputs.zen-browser.packages."${system}".default

      # gnome
      loupe
      gnome-system-monitor
      gnome-disk-utility
      gnome-clocks
      gnome-calculator
      nautilus
      seahorse

      # system
      xdg-utils
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
      hyprpolkitagent
      wl-clipboard
      ffmpeg-full

      # dev
      gcc
      gnumake
      postgresql
      nodejs
      corepack
      pkg-config
      cpio
      redis
    ];
  };
}
