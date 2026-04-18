{ pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    dconf.enable = true;
  };

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      GOOGLE_CHROME_PATH = "${pkgs.google-chrome}";
      NIXOS_OZONE_WL = "1";
    };
  };

  environment.systemPackages = with pkgs; [
    cbonsai
    fastfetch
    kubectl
    kubernetes-helm
    kubectx
    kops
    awscli2
    dive
    feh
    wlr-randr
    bfg-repo-cleaner
    gource
    supabase-cli
    claude-code
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
    android-tools
    android-studio-full
  ];
}
