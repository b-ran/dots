{ lib, pkgs, user, ... }:

{
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

    ];
  };
}
