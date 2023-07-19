{ config, lib, pkgs, inputs, user, ... }:

{
  system.stateVersion = "23.11";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };

  security.polkit.enable = true;

  services.udisks2.enable = true;

  networking.networkmanager = {
    enable = true;
  };

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      networkmanagerapplet
      networkmanager-openvpn
    ];
  };

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
