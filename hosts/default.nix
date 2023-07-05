{ lib, inputs, nixpkgs, home-manager, hyprland, user, system}:
  let
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    brandon = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit pkgs hyprland user system;
      };
      modules = [
        hyprland.nixosModules.default
        ./configuration.nix
         ./desktop

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
          };
          home-manager.users.${user} = {
            imports = [
              ./home.nix
              desktop/home.nix
            ];
          };
        }
      ];
    };
  }

