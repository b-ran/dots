{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dxvk
    lutris
    bottles
    heroic
    wine-wayland
    wine64
    winetricks
    protonup-qt
    piper
    libratbag
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
    };
  };

  hardware.steam-hardware.enable = true;

  systemd.services.ratbagd = {
    description = "Ratbagd";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libratbag}/bin/ratbagd";
      Restart = "always";
    };
  };
}