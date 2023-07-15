{ pkgs, hyprland, ... }:

{
  imports =
    [ (import ../../home/programs/desktop/waybar.nix) ] ++
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    (import ../../home) ++
    (import ../../home/services) ++
    (import ../../home/programs/apps) ++
    (import ../../home/programs/cli);

}
