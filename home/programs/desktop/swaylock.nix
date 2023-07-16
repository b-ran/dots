{ pkgs, ... }:

{

  programs.swaylock =
  let
    base = "1e1e2e";
    red = "f38ba8";
    green = "a6e3a1";
    blue = "89b4fa";
    yellow = "f9e2af";
    mauve = "cba6f7";
    text = "cdd6f4";
  in
  {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      color = "${base}";
      text-color = "${text}";
      inside-ver-color = "${green}";
      inside-wrong-color = "${red}";
      inside-color = "${base}";
      ring-ver-color = "${green}";
      ring-wrong-color = "${red}";
      ring-color = "${blue}";
      line-color = "${base}";
      separator-color = "${base}";
      key-hl-color = "${yellow}";
      bs-hl-color = "${red}";
      verif-color = "${base}";
      wrong-color = "${mauve}";
      font = "JetBrainsMono Nerd Font";
      font-size = 24;
      indicator-radius = 140;
      indicator-thickness = 10;
      clock = true;
      indicator = true;
      timestr = "%I:%M %p";
      datestr = "%A, %d %B";
    };
  };

  home.packages = [
    pkgs.swayidle
  ];
}