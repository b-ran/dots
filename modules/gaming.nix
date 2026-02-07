{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dxvk
    lutris
    bottles
    wine-wayland
    wine64
    winetricks
    protonup-qt
    piper
    libratbag
    prismlauncher
    gamemode
    gamescope
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
    };
  };

  hardware.steam-hardware.enable = true;

  # Logitech mouse settings with Piper
  systemd.services.ratbagd = { 
    description = "Ratbagd";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libratbag}/bin/ratbagd";
      Restart = "always";
    };
  };
}