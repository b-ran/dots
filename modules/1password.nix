{ pkgs, user, ... }:

{
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ user ];
    };
    _1password = {
      enable = true;
    };
  };
}
