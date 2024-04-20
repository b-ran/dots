{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 32; # 24, 32, 48, 64
    gtk.enable = true;
    x11.enable = true;
  };
}
