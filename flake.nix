{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    # Personal Flakes

    # secrets.url = "git+ssh://git@github.com/b-ran/nixos-secrets";

    ssh-keys.url = "https://github.com/b-ran.keys";
    ssh-keys.flake = false;
  };

outputs =
    inputs@{
      self,
      disko,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      hyprland-contrib,
      niri,
      ssh-keys,
      ...
    }:
    let
      inherit (self) outputs;
      # Helper function to create a nixos system configuration
      # Usage:
      #   Default x86_64:  mkSystem { host = "hostname"; };
      #   Custom system:   mkSystem { host = "hostname"; system = "aarch64-linux"; };
      #   Custom user:     mkSystem { host = "hostname"; user = "Lewis"}
      mkSystem =
        {
          host,
          system ? "x86_64-linux",
          user ? "brandon",
        }:
        nixpkgs.lib.nixosSystem {
          modules = [
            { nixpkgs.hostPlatform = system; }
            ./hosts/${host}/configuration.nix
          ];
          specialArgs = {
            inherit inputs outputs user system;
          };
        };
    in
    {
      nixosConfigurations = {
        workstation = mkSystem { host = "workstation"; };
        laptop = mkSystem { host = "framework"; };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
