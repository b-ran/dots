{ lib, inputs, nixpkgs, home-manager, darwin, user, ...}:

let
  system = "aarch64-darwin";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  mac = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit lib inputs pkgs secrets user; };
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            name = "mac";
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
