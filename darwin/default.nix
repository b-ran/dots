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
    specialArgs = { inherit lib inputs pkgs user; };
    modules = [
      ./configuration.nix
      inputs.stylix.darwinModules.stylix
      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bak";
        home-manager.extraSpecialArgs = {
          inherit inputs user;
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
