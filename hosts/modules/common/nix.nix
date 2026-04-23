{
  config,
  inputs,
  pkgs,
  ...
}:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      stable = import inputs.nixpkgs-stable {
        config = config.nixpkgs.config;
        system = pkgs.stdenv.hostPlatform.system;
      };
      unstable = import inputs.nixpkgs-unstable {
        config = config.nixpkgs.config;
        system = pkgs.stdenv.hostPlatform.system;
      };
    };
  };
}
