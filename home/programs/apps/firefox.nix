{ pkgs, ... }:

{
  programs.firefox = {
    package = pkgs.wrapFirefox pkgs.firefox-devedition-unwrapped {
      extraPolicies = {
        ExtensionSettings = { };
      };
    };
  };
}
