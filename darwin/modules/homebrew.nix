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
    ];
    casks = [
      "firefox-developer-edition"
      "google-chrome"
      "displaylink"
      "pritunl"
      "discord"
      "1password"
      "1password-cli"
      "docker"
    ];
  };
}