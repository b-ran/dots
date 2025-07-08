{ pkgs, user, stylix,  ... }:

{
  stylix.targets.firefox.profileNames = [ "default" ];
  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.firefox;
  #   profiles = {
  #     default = {
  #       id = 0;
  #       name = "default";
  #       isDefault = true;

  #       settings = {
  #         "signon.rememberSignons" = false;
  #         "privacy.trackingprotection.enabled" = true;
  #         "devtools.toolbox.host" = "right";
  #       };

  #       search = {
  #         force = true;
  #         default = "google";
  #         order = [ "google" ];
  #         engines = {
  #           "Nix Packages" = {
  #             urls = [{
  #               template = "https://search.nixos.org/packages";
  #               params = [
  #                 { name = "type"; value = "packages"; }
  #                 { name = "query"; value = "{searchTerms}"; }
  #               ];
  #             }];
  #             icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  #             definedAliases = [ "@np" ];
  #           };
  #           "bing".metaData.hidden = true;
  #           "google".metaData.alias = "@g";
  #         };
  #       };
  #     };
  #   };
  # };


   programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox;
        profiles.default = {
          # id = 0;
          name = "default";
          # isDefault = true;

          search = {
            default = "google";
            order = [ "google" ];
            engines = {
              "bing".metaData.hidden = true;
            };
            force = true;
          };

          settings = {
            # Disable about:config warning
            # "browser.aboutConfig.showWarning" = false;

            # Mozilla telemetry
            # "toolkit.telemetry.enabled" = true;

            # Set dev tools to open on the right side
            # "devtools.toolbox.host" = "right";

            # Homepage settings
            # 0 = blank, 1 = home, 2 = last visited page, 3 = resume previous session
            # "browser.startup.page" = 1;
            # "browser.startup.homepage" = "about:home";
            # "browser.newtabpage.enabled" = true;
            # "browser.newtabpage.activity-stream.topSitesRows" = 2;
            # "browser.newtabpage.storageVersion" = 1;
            # "browser.newtabpage.pinned" = [
            #   {
            #     "label" = "GitHub";
            #     "url" = "https://github.com";
            #   }
            #   {
            #     "label" = "YouTube";
            #     "url" = "https://youtube.com";
            #   }
            #   {
            #     "label" = "Reddit";
            #     "url" = "https://reddit.com";
            #   }
            # ];

            # Activity Stream
            # "browser.newtab.preload" = false;
            # "browser.newtabpage.activity-stream.telemetry" = false;
            # "browser.newtabpage.activity-stream.showSponsored" = false;
            # "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            # "browser.newtabpage.activity-stream.feeds.topsites" = true;
            # "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            # "browser.newtabpage.activity-stream.feeds.snippets" = false;
            # "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            # "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
            # "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            # "browser.newtabpage.activity-stream.default.sites" = "";

            # Addon recomendations
            # "browser.discovery.enabled" = false;
            # "extensions.getAddons.showPane" = false;
            # "extensions.htmlaboutaddons.recommendations.enabled" = false;

            # Crash reports
            # "breakpad.reportURL" = "";
            # "browser.tabs.crashReporting.sendReport" = false;

            # Auto-decline cookies
            # "cookiebanners.service.mode" = 2;
            # "cookiebanners.service.mode.privateBrowsing" = 2;

            # Disable autoplay
            # "media.autoplay.default" = 5;

            # Prefer dark theme
            # "layout.css.prefers-color-scheme.content-override" = 0; # 0: Dark, 1: Light, 2: Auto

            # HTTPS only
            # "dom.security.https_only_mode" = true;

            # Trusted DNS (TRR)
            # "network.trr.mode" = 2;
            # "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";

            # ECH - prevent TLS connections leaking request hostname
            # "network.dns.echconfig.enabled" = true;
            # "network.dns.http3_echconfig.enabled" = true;

            # Tracking
            # "browser.contentblocking.category" = "strict";
            # "privacy.trackingprotection.enabled" = true;
            # "privacy.trackingprotection.pbmode.enabled" = true;
            # "privacy.trackingprotection.emailtracking.enabled" = true;
            # "privacy.trackingprotection.socialtracking.enabled" = true;
            # "privacy.trackingprotection.cryptomining.enabled" = true;
            # "privacy.trackingprotection.fingerprinting.enabled" = true;

            # Fingerprinting
            # "privacy.fingerprintingProtection" = true;
            # "privacy.resistFingerprinting" = true;
            # "privacy.resistFingerprinting.pbmode" = true;

            # "privacy.firstparty.isolate" = true;

            # URL query tracking
            # "privacy.query_stripping.enabled" = true;
            # "privacy.query_stripping.enabled.pbmode" = true;

            # Prevent WebRTC leaking IP address
            # "media.peerconnection.ice.default_address_only" = true;

            # Disable password manager
            # "signon.rememberSignons" = false;
            # "signon.autofillForms" = false;
            # "signon.formlessCapture.enabled" = false;

            # Hardens against potential credentials phishing:
            # 0 = don’t allow sub-resources to open HTTP authentication credentials dialogs
            # 1 = don’t allow cross-origin sub-resources to open HTTP authentication credentials dialogs
            # 2 = allow sub-resources to open HTTP authentication credentials dialogs (default)
            # "network.auth.subresource-http-auth-allow" = 1;
          };
        };
      };
    };
}
