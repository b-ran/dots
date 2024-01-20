{ config, lib, pkgs, ...}:

with lib;
{
  options.system = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Mac OS X system configuration.
      '';
    };
  };

  # Changes will require logging out and back in to take effect.
  config = mkIf config.system.enable {
    system = {
      defaults = {
        NSGlobalDomain = {
          KeyRepeat = 1;
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
          _HIHideMenuBar = true;
        };
        spaces = {
          spans-displays = false;
        };
        screensaver = {
          askForPassword = true;
          askForPasswordDelay = 0;
        };
        dock = {
          autohide = true;
          orientation = "bottom";
          showhidden = true;
          static-only = true;
          mru-spaces = false;
          tilesize = 40;
        };
        finder = {
          QuitMenuItem = true;
          AppleShowAllFiles = true;
          AppleShowAllExtensions = true;
          ShowPathbar = true;
          ShowStatusBar = true;
        };
        trackpad = {
          Clicking = true;
          Dragging = true;
          TrackpadThreeFingerDrag = true;
          TrackpadRightClick = true;
        };
        loginwindow = {
          DisableConsoleAccess = true;
        };
      };
      activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh'';
      stateVersion = 4;
    };
  };
}