{ pkgs, user, ... }:

{
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
        bookmarks = [];
        search = {
          force = true;
          default = "Google";
          order = [ "Google" ];
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
            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g";
          };
        };
      };
    };
  };
}
