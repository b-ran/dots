{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Adding an old nixpkgs to get python38 and python39 working, ref
    # <https://discourse.nixos.org/t/python3-8-sphinx-build-failure-on-unstable/29102/11?u=stianlagstad>
    old-nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "f294325aed382b66c7a188482101b0f336d1d7db";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs @ { self, nixpkgs, old-nixpkgs, home-manager, hyprland, hyprland-contrib, agenix, ... }:
    let
      user = "brandon";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs old-nixpkgs home-manager hyprland hyprland-contrib agenix user system;
        }
      );
    };
}
