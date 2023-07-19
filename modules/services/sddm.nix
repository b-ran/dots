{ pkgs, ... }:

let
  catppuccinSddm = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "bde6932e1ae0f8fdda76eff5c81ea8d3b7d653c0";
    sha256 = "sha256-ceaK/I5lhFz6c+UafQyQVJIzzPxjmsscBgj8130D4dE=";
  };
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      sessionPackages = [ pkgs.hyprland ];
      sddm = {
        enable = true;
        theme = "catppuccin-mocha";
        settings = {
          Theme = {
            ThemeDir = "${catppuccinSddm}/src/";
          };
        };
      };
    };
  };
}
