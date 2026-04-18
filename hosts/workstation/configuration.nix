{
  inputs,
  user,
  system,
  ...
}:

{

  imports = [
    ./hardware-configuration.nix
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
    ./services
    ../modules/common
    ../modules/desktop
    ../modules/docker.nix
    ../modules/gaming.nix
    ../modules/gdm.nix
    ../modules/grub.nix
    ../modules/hyprland.nix
    ../modules/hyprlock.nix
    ../modules/niri.nix
    ../modules/nvidia.nix
  ];

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    backupFileExtension = "bk";
    extraSpecialArgs = {
      inherit inputs user system;
      host = {
        name = "workstation";
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
  networking.hostName = "workstation";
}
