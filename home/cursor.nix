{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 32; # 24, 32, 48, 64
    gtk.enable = true;
    x11.enable = true;
  };
}
