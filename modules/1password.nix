{ pkgs, home-manager, user, ... }:

{
  home-manager.users.${user} = {
    home.file.".config/1Password/ssh/agent.toml".text = ''
      [[ssh-keys]]
      vault = "Developer"
    '';
  };

  environment.sessionVariables = {
    SSH_AUTH_SOCK = "~/.config/1Password/ssh/agent.sock";
  };

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
