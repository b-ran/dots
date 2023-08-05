{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        piper
        libratbag
    ];

    systemd.services.ratbagd = {
      description = "Ratbagd";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.libratbag}/bin/ratbagd";
        Restart = "always";
      };
    };
}