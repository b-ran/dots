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
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs = {
    niri = {
      package = pkgs.niri-stable;
      enable = true;
    };
  };

  home-manager.users.${user} = {

  };
}
