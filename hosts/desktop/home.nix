{ pkgs, hyprland, ... }:

{
  imports =
    [ (import ../../home/programs/gui/waybar.nix) ] ++
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
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

    pointerCursor = {
      # This will set cursor system-wide so applications can not choose their own
      gtk.enable = true;
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
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
