{ pkgs, ... }:

{
  programs.starship =
    {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # Other config here
        format = "$all"; # Remove this line to disable the default prompt format
        aws = {
          disabled = true;
        };
      };
  };
}
