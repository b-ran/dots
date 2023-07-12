{ pkgs, hyprland, ... }:

{
  imports =
    [ (import ../../home/programs/desktop/waybar.nix) ] ++
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    (import ../../home) ++
    (import ../../home/programs/cli);


  home = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1;
      MOZ_ENABLE_WAYLAND = 1;
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      BROWSER = "firefox";
    };

  };

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        ExtensionSettings = { };
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrains Mono Medium";
    };
  };

}
