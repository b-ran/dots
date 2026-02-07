{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    webcord-vencord
    discord
  ];

  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "04cq4kmv8gh2myfpw3yry0ggf30nj10ihvpmd6j1fdxp2xdkv0cy";
          };
        }
      );
    })
  ];
}
