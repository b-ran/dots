{ config, pkgs, user, ...}:

{
  imports = ( import ./modules );

  homebrew.enable = true;
  skhd.enable = true;
  system.enable = true;
  yabai.enable = true;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };
        
  fonts = {
    packages = with pkgs; [
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

  programs = {
    zsh.enable = true;
  };

  services = {
    nix-daemon.enable = true;
  };

  environment = {
    shells = with pkgs; [ zsh ];
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