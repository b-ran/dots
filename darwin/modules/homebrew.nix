{ lib, pkgs, ...}:

with lib;
{
  homebrew = {
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    taps = [
      "homebrew/cask-versions"
    ];
    brews = [
      "redis"
    ];
    casks = [
      "firefox-developer-edition"
      "google-chrome"
      "displaylink"
      "alacritty"
      "pritunl"
      "discord"
      "1password"
      "1password-cli"
      "docker"
    ];
  };
}