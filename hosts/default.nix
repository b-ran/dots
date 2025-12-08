{ lib, inputs, nixpkgs, home-manager, user, system }:

{
  desktop = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs home-manager user system;
      host = {
        name = "desktop";
      };
    };
    modules = [
      { nixpkgs.config.allowUnfree = true; }
      ./configuration.nix
      ./desktop
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
      inherit inputs home-manager user system;
      host = {
        name = "work";
      };
    };
    modules = [
      { nixpkgs.config.allowUnfree = true; }
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