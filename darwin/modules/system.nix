{ config, lib, pkgs, ...}:

{
  # Changes will require logging out and back in to take effect.
  system = {
    defaults = {
      NSGlobalDomain = {
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      spaces = {
        spans-displays = true;
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
}