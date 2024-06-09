{ pkgs, ... }:

{
  programs.swaylock =
    {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        indicator-radius = 140;
        indicator-thickness = 10;
        indicator = true;
      };
    };
}
