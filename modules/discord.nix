{ config, lib, pkgs, ... }:

let
  discordKrispPatch =
    let
      discordDrv = pkgs.discord;
      discordName = builtins.parseDrvName discordDrv.name;
      discord_version = discordName.version;
      file = "~/.config/discord/${discord_version}/modules/discord_krisp/discord_krisp.node";
    in
    # https://github.com/NixOS/nixpkgs/issues/195512
    pkgs.writeShellScriptBin "discord-krisp-patch" ''
      set -e
      rizin_cmd="${pkgs.rizin}/bin/rizin"
      rz_find_cmd="${pkgs.rizin}/bin/rz-find"
      addr=$($rz_find_cmd -x '4889dfe8........4889dfe8' "${file}" | head -n1)
      $rizin_cmd -q -w -c "s $addr + 0x12 ; wao nop" "${file}"
    '';
in
{
  environment.systemPackages = with pkgs; [
    webcord
    discord
    discordKrispPatch
    rizin
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
