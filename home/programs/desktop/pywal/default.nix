{ config, pkgs, ... }:

{
  home = {
    file.".config/wal/templates".source = ./templates;
    file.".config/wal/colorschemes/dark".source = ./colorschemes;
  };

  programs = {
    pywal = {
      enable = true;
    };
  };
}