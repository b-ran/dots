{ pkgs, ... }:

{
  programs.chromium = {
    commandLineArgs = [
      "--force-dark-mode"
      "--enable-features=WebUIDarkMode"
    ];
  };
}
