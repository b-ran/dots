{ lib, inputs, nixpkgs, old-pkgs, home-manager, hyprland, hyprland-contrib, secrets, user, public-key, system }:
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
      inherit pkgs old-pkgs home-manager hyprland-contrib secrets user public-key system;
      host = {
        name = "desktop";
      };
    };
    modules = [
      ./configuration.nix
      ./desktop
      (secrets.nixosModule { user = "${user}"; system = "${system}"; })
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit hyprland user system;
          host = {
            name = "desktop";
          };
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

  work = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit pkgs old-pkgs home-manager hyprland-contrib user public-key system;
      host = {
        name = "work";
      };
    };
    modules = [
      ./configuration.nix
      ./work
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user hyprland;
          host = {
            name = "work";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            work/home.nix
          ];
        };
      }
    ];
  };
}
