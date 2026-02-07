{ lib, inputs, nixpkgs, home-manager, user, system }:

let
  # Helper function to conditionally include secrets module
  secretsModule = if inputs.secrets != null 
    then [ (inputs.secrets.nixosModule { user = "${user}"; system = "${system}"; }) ]
    else [];
in
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
            ./desktop/services/hypridle.nix
          ];
        };
      }
    ] ++ secretsModule;
  };

  framework = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs home-manager user system;
      host = {
        name = "framework";
      };
    };
    modules = [
      { nixpkgs.config.allowUnfree = true; }
      ./configuration.nix
      ./framework
      ./framework/disko-config.nix
      inputs.disko.nixosModules.disko
      inputs.stylix.nixosModules.stylix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bk";
        home-manager.extraSpecialArgs = {
          inherit inputs user system;
          host = {
            name = "framework";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./framework/services/hypridle.nix
          ];
        };
      }
    ] ++ secretsModule;
  };
}