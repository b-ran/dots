{
  inputs,
  user,
  system,
  ...
}:

{

  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
    ../modules/common
    ../modules/desktop
    ../modules/displaylink.nix
    ../modules/docker.nix
    ../modules/gdm.nix
    ../modules/grub.nix
    ../modules/hyprland.nix
    ../modules/hyprlock.nix
    ../modules/niri.nix
    ../modules/power.nix
  ];

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    backupFileExtension = "bk";
    extraSpecialArgs = {
      inherit inputs user system;
      host = {
        name = "framework";
      };
    };
    users.${user} = {
        imports = [
          ../../home/apps
          ../../home/cli
          ../../home/desktop
          ../../home/services
        ];
        home.stateVersion = "23.11";
        nixpkgs.config.allowUnfree = true;
    };
  };

  system.stateVersion = "23.11";
  networking.hostName = "framework";
}
