{ config, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      rounded_corners = true;
    };
  };
}
