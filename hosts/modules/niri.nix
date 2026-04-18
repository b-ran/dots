{
  inputs,
  pkgs,
  config,
  home-manager,
  user,
  ...
}:

with config.lib.stylix.colors;
{
  programs = {
    niri = {
      package = pkgs.niri;
      enable = true;
    };
  };

  home-manager.users.${user} = {

  };
}
