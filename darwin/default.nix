{ lib, inputs, nixpkgs, home-manager, darwin, user, ...}:

let
  system = "aarch64-darwin";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  "Brandons-MacBook-Pro" = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit pkgs inputs user; };
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            name = "Brandons-MacBook-Pro";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
          ];
        };
      }
    ];
  };
}
