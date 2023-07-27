{ pkgs, old-nixpkgs, user, system, ... }:

{
  system.stateVersion = "23.11";
  time.timeZone = "Pacific/Auckland";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" "kvm" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };

  fonts.packages = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  networking.networkmanager.enable = true;

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; ([
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
      postgresql_15

      #util
      jq
      playerctl
      brightnessctl
      pamixer
      qt6.qtwayland
      qt6.full
      speechd
      networkmanagerapplet
      networkmanager-openvpn
      feh
      polkit-kde-agent

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
    ])  ++ (with old-nixpkgs.legacyPackages.${system}; [
      # <https://discourse.nixos.org/t/python3-8-sphinx-build-failure-on-unstable/29102/11?u=stianlagstad>
      python38
      python39
    ]);
  };

  networking.firewall.enable = false;

  security.pam.services.swaylock = { };
  security.pam.services.swaylock.text = ''
    auth include login
  '';
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.udisks2.enable = true;
  services.gnome.gnome-keyring.enable = true;

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
