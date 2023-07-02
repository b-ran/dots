{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... } @ inputs:
    let
      inherit (nixpkgs) lib;
      genSystems = lib.genAttrs [
        "x86_64-linux"
      ];
      pkgsFor = genSystems (system:
        import nixpkgs {
          inherit system;
          overlays = [
           self.overlays.default
            inputs.hyprland-protocols.overlays.default
          ];
        });

      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        brandon = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.brandon = {
                imports = [./home.nix];
              };
            }
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };
    };
}