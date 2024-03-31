{ pkgs, ... }:

{
  home.packages = with pkgs; [
    udiskie
  ];

  services = {
    udiskie = {
      enable = true;
      automount = false;
      notify = true;
      tray = "auto";
    };
  };
}
