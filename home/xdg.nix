{ pkgs, ... }:
# to check on portal status - nix run nixpkgs#door-knocker

let
  browser = [ "firefox-developer-edition.desktop" ];
  media = [ "mpv.desktop" ];
  image = [ "feh.desktop" ];
  torrent = [ "transmission-gtk.desktop" ];
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    "audio/*" = media;
    "video/*" = media;
    "image/*" = image;
    "application/json" = browser;
    "application/pdf" = [ "zathura.desktop" ];
    "application/x-bittorrent" = torrent;
    "application/x-bittorrent;x-scheme-handler/magnet" = torrent;
    "x-scheme-handler/discord" = [ "discord.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
  };
in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome ];
    };
    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };
  };
}