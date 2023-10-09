{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Adding an old nixpkgs to get python38 and python39 working, ref
    # <https://discourse.nixos.org/t/python3-8-sphinx-build-failure-on-unstable/29102/11?u=stianlagstad>
    old-pkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "f294325aed382b66c7a188482101b0f336d1d7db";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets.url = "git+ssh://git@github.com/b-ran/nixos-secrets.git";
  };

  outputs = inputs @ { self, nixpkgs, old-pkgs, home-manager, darwin, hyprland, hyprland-contrib, secrets, ... }:
    let
      user = "brandon";
      public-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/kUnW9xrrFeqaAjRVzfJw+SCgIhUabAWmyOhH8yOvS";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs old-pkgs home-manager hyprland hyprland-contrib secrets user public-key system;
        }
      );

      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager darwin user;
        }
      );
    };
}
