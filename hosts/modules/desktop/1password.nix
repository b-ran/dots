{ pkgs, user, ... }:

{
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ user ];
      package = pkgs._1password-gui; # or pkgs._1password-beta-gui
    };
    _1password = {
      enable = true;
    };
  };
}
