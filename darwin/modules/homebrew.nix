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
      "firefox-developer-edition"
      "chromium"
      "google-chrome"
      "slack"
      "spotify"
      "discord"
      "intellij-idea"
      "1password"
      "displaylink"
      "pritunl"
      "keepassxc"
    ];
  };
}