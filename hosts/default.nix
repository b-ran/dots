{ lib, inputs, nixpkgs, home-manager, user, system }:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  desktop = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit pkgs inputs home-manager user system;
      host = {
        name = "desktop";
      };
    };
    modules = [
      ./configuration.nix
      ./desktop
      inputs.stylix.nixosModules.stylix
      (inputs.secrets.nixosModule { user = "${user}"; system = "${system}"; })
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bak";
        home-manager.extraSpecialArgs = {
          inherit inputs user system;
          host = {
            name = "desktop";
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

  work = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit pkgs inputs home-manager user system;
      host = {
        name = "work";
      };
    };
    modules = [
      ./configuration.nix
      ./work
      inputs.stylix.nixosModules.stylix
      (inputs.secrets.nixosModule { user = "${user}"; system = "${system}"; })
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bk";
        home-manager.extraSpecialArgs = {
          inherit inputs user system;
          host = {
            name = "work";
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
