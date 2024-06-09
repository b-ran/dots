{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets.url = "git+ssh://git@github.com/b-ran/nixos-secrets";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, darwin, hyprland-contrib, ... }:
    let
      user = "brandon";
      public-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/kUnW9xrrFeqaAjRVzfJw+SCgIhUabAWmyOhH8yOvS";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager hyprland-contrib user public-key system;
        }
      );

      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager darwin user;
        }
      );
    };
}
