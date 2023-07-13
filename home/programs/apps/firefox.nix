{ pkgs, ... }:

{

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-devedition-unwrapped {
      extraPolicies = {
        ExtensionSettings = { };
      };
    };
  };

}
