{
  lib,
  inputs,
  system,
  pkgs,
  user,
  ...
}:

{
  imports =
    (import ../home)
    ++ (import ../home/services)
    ++ (import ../home/programs/apps)
    ++ (import ../home/programs/desktop)
    ++ (import ../home/programs/cli);

  programs = {
    home-manager.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  services = {
    mpris-proxy.enable = true;
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
      killall
      glow
      nix-prefetch-git
      gource
      supabase-cli
      claude-code
      xh
      dust
      dua
      yazi
      ncspot

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
      # google-chrome
      teams-for-linux
      vscode
      firefox-bin

      # gnome
      loupe
      gnome-system-monitor
      gnome-disk-utility
      gnome-clocks
      gnome-calculator
      nautilus
      seahorse
      file-roller
      gnome-usage
      gnome-logs
      networkmanagerapplet
      simple-scan

      # system
      xdg-utils
      libnotify
      pavucontrol
      playerctl
      brightnessctl
      pamixer
      qt6.qtwayland
      speechd
      openvpn
      hyprpolkitagent
      wl-clipboard
      ffmpeg-full
      alsa-utils

      # dev
      gcc
      gnumake
      postgresql
      nodejs
      pnpm
      yarn
      pkg-config
      cpio
      redis
      nixfmt
    ];
  };
}
