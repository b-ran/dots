{ lib, inputs, nixpkgs, old-nixpkgs, home-manager, hyprland, hyprland-contrib, agenix, user, system }:
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
      inherit pkgs old-nixpkgs home-manager hyprland-contrib agenix user system;
      host = {
        name = "desktop";
        fristMonitor = "DP-1";
        secondMonitor = "HDMI-A-1";
      };
    };
    modules = [
      ./configuration.nix
      ./desktop
      agenix.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user hyprland;
          host = {
            name = "desktop";
            fristMonitor = "DP-1";
            secondMonitor = "HDMI-A-1";
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
      inherit pkgs old-nixpkgs home-manager hyprland-contrib agenix user system;
      host = {
        name = "work";
        fristMonitor = "DVI-I-1";
        secondMonitor = "DP-1";
        thirdMonitor = "HDMI-A-1";
      };
    };
    modules = [
      ./configuration.nix
      ./work
      agenix.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user hyprland;
          host = {
            name = "work";
            fristMonitor = "DVI-I-1";
            secondMonitor = "DP-1";
            thirdMonitor = "HDMI-A-1";
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
