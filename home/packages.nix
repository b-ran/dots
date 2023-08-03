{ pkgs, system, ... }:

{
  home.packages = with pkgs; [

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
    awscli2
    helm
    kubectx
    kops
    dive
    jq
    zip
    tree
    feh

    # gui apps
    keepassxc
    remmina
    freerdp
    slack
    ventoy-full
    gnome.gnome-system-monitor
    transmission-gtk
    spotify

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
    xclip

    # dev
    gcc
    gnumake
    postgresql_15
    nodejs_20
    yarn
  ];
}

