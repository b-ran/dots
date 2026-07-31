{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    ie-r.url = "github:miaupaw/ie-r";
    ie-r.inputs.nixpkgs.follows = "nixpkgs";

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
      nixpkgs-unstable,
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
            inherit
              inputs
              outputs
              user
              system
              ;
          };
        };
    in
    {
      nixosConfigurations = {
        workstation = mkSystem { host = "workstation"; };
        framework = mkSystem { host = "framework"; };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
