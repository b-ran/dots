{ pkgs, hyprland, ... }:

{
    imports =
      [(import ../../home/programs/gui/waybar.nix)] ++
      [(import ../../modules/desktop/hyprland/home.nix)]++
      (import ../../home/programs/cli);


  home = {
    sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = 1;
        BROWSER = "firefox";
    };
  };

}
