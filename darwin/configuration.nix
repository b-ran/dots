{ config, pkgs, user, ...}:

{
  imports = ( import ./modules );

  users.users.${user} = {
    home = "/Users/${user}";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      source-code-pro
      font-awesome
      jetbrains-mono
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };

  networking = {
    computerName = "mac";
    hostName = "mac";
  };

  environment = {
    systemPackages = with pkgs; [
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
      # helm
      kubectx
      kops
      dive
      jq
      zip
      tree
      feh
      bfg-repo-cleaner

      gcc
      gnumake
      postgresql
      nodejs
      yarn
    ];
  };

  nix = {
    package = pkgs.nix;
    useDaemon = true;
    gc = {
       automatic = true;
       interval.Day = 7;
       options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };
}