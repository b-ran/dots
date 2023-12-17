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
      "1password"
      "1password-cli"
    ];
  };
}