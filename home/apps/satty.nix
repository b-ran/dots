{ config, pkgs, ... }:

with config.lib.stylix.colors.withHashtag;
{
  programs.satty = {
    enable = true;
    settings = {
      general = {
        fullscreen = false;
        early-exit = true;
        copy-command = "wl-copy";
        annotation-size-factor = 2;
        output-filename = "${config.home.homeDirectory}/Pictures/satty-%Y-%m-%d_%H:%M:%S.png";
        initial-tool = "pointer";
        actions-on-enter = [ "save-to-clipboard" ];
        disable-notifications = true;
      };
      font = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };
      color-palette = {
        palette = [
          base08
          base09
          base0A
          base0B
          base0C
          base0D
          base0E
          base05
        ];
      };
    };
  };
}
