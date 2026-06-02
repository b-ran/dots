{ pkgs, ... }:

{
  services = {
    udisks2.enable = true;
    dbus.packages = [ pkgs.gcr ]; # Needed for Gnome services
    dbus.implementation = "broker"; # better UWSM compatibility
    gvfs.enable = true;
    gnome.sushi.enable = true; # File previewer for Nautilus
  };
}
