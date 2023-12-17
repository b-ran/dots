{ config, lib, pkgs, ...}:

with lib;
{
  options.homebrew = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Homebrew package manager for macOS with several packages and casks.
      '';
    };
  };
  config = mkIf config.homebrew.enable {
    homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = false;
        upgrade = false;
        cleanup = "zap";
      };
      taps = [
        "homebrew/cask-versions"
      ];
      brews = [
      ];
      casks = [
        # "alacritty" broken in homebrew
        "firefox-developer-edition"
        "google-chrome"
        "slack"
        "spotify"
        "discord"
        "intellij-idea"
        "1password"
        "displaylink"
        "pritunl"
        "pika"
        "keepassxc"
        "raycast"
      ];
    };
  };
}