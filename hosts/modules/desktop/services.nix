{ pkgs, ... }:

{
  services = {
    udisks2.enable = true;
    dbus.packages = [ pkgs.gcr ]; # Needed for Gnome services
    gvfs.enable = true;
    gnome.sushi.enable = true; # File previewer for Nautilus
  };
}
