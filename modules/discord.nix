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
            sha256 = "1z980p3zmwmy29cdz2v8c36ywrybr7saw8n0w7wlb74m63zb9gpi";
          };
        }
      );
    })
  ];
}
