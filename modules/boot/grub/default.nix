{ config, pkgs, inputs, ... }:

let
  catppuccinGrub = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
    sha256 = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  };
in
{
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
    configurationLimit = 5;
    theme = "${catppuccinGrub}/src/catppuccin-mocha-grub-theme/";
  };
}
