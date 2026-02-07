{ pkgs, ... }:
# to check on portal status - nix run nixpkgs#door-knocker
# check desktop file names find / -name "feh.desktop"
let
  browser = [ "firefox.desktop" ];
  media = [ "mpv.desktop" ];
  image = [ "feh.desktop" ];
  torrent = [ "transmission.desktop" ];
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "default-web-browser" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;
    "x-scheme-handler/chrome" = browser;

    "audio/*" = media;
    "video/*" = media;
    "image/*" = image;
    "image/jpeg" = image;
    "application/json" = browser;
    "application/pdf" = browser;
    "application/x-bittorrent" = torrent;
    "x-scheme-handler/magnet" = torrent;
    "x-scheme-handler/discord" = [ "discord.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
    "x-scheme-handler/msteams" = [ "teams-for-linux.desktop" ];
  };
  entries = {
    transmission = {
      name = "transmission-gtk";
      exec = "transmission-gtk %U";
    };
  };
in
{
  xdg = {
    desktopEntries = entries;
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };
  };
}