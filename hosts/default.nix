{ lib, inputs, nixpkgs, old-nixpkgs, home-manager, hyprland, hyprland-contrib, secrets, user, system }:
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
      inherit pkgs old-nixpkgs home-manager hyprland-contrib secrets user system;
      host = {
        name = "desktop";
        firstMonitor = "DP-1";
        secondMonitor = "HDMI-A-1";
      };
    };
    modules = [
      ./configuration.nix
      ./desktop
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit hyprland user system;
          host = {
            name = "desktop";
            firstMonitor = "DP-1";
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
    ] ++ lib.optional (secrets ? nixosModule) (secrets.nixosModule { user = "${user}"; system = "${system}"; });
  };

  work = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit pkgs old-nixpkgs home-manager hyprland-contrib user system;
      host = {
        name = "work";
        firstMonitor = "DVI-I-1";
        secondMonitor = "DP-1";
        thirdMonitor = "HDMI-A-1";
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
            firstMonitor = "DVI-I-1";
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
