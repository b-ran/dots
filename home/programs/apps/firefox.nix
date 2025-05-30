{ pkgs, user, stylix,  ... }:

{
  stylix.targets.firefox.profileNames = [ "dev-edition-default" ];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
    profiles = {
      dev-edition-default = {
        name = "dev-edition-default";
        settings = {
          "signon.rememberSignons" = false;
          "privacy.trackingprotection.enabled" = true;
          "devtools.toolbox.host" = "right";
        };
        search = {
          force = true;
          default = "google";
          order = [ "google" ];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "bing".metaData.hidden = true;
            "google".metaData.alias = "@g";
          };
        };
      };
    };
  };
}
