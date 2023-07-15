{ config, pkgs, ... }:

{
  xdg.configFile."btop/themes/catppuccin_mocha.theme".text = builtins.readFile (pkgs.fetchFromGitHub
    {
      owner = "catppuccin";
      repo = "btop";
      rev = "89ff712eb62747491a76a7902c475007244ff202";
      sha256 = "sha256-ovVtupO5jWUw6cwA3xEzRe1juUB8ykfarMRVTglx3mk=";
    }
  + "/catppuccin_mocha.theme");

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      rounded_corners = true;
    };
  };
}
