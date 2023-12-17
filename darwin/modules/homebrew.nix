{ config, lib, pkgs, ...}:

{
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
}