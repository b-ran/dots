{ lib, inputs, pkgs, user, ... }:

{
    imports =
      (import ../home/programs/apps) ++
      (import ../home/programs/cli);

    programs = {
      cava.enable = lib.mkForce false;
      mpv.enable = lib.mkForce false;
      firefox.enable = lib.mkForce false;
      chromium.enable = lib.mkForce false;
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

    home = {
      username = "${user}";
      homeDirectory = "/Users/${user}";
      stateVersion = "23.11";

      packages = with pkgs; [
        wget
        cbonsai
        viddy
        neofetch
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
        bfg-repo-cleaner
        soco-cli
        supabase-cli
        corepack

        gcc
        gnumake
        postgresql
        nodejs
        slack
        spotify
        pika
        raycast
        keepassxc
        jetbrains.idea-ultimate
      ];
    };
}