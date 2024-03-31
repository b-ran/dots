{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox-devedition-bin.desktop" ];
    "text/xml" = [ "firefox-devedition-bin.desktop" ];
    "x-scheme-handler/http" = [ "firefox-devedition-bin.desktop" ];
    "x-scheme-handler/https" = [ "firefox-devedition-bin.desktop" ];
  };
}
