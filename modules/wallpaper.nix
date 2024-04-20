{ config, pkgs, user, ... }:

{
  systemd.paths."watch-current-wallpaper" = {
    wantedBy = [ "multi-user.target" ];
    pathConfig = {
      PathChanged = "/home/${user}/.config/current-wallpaper";
      Unit = "copy-current-wallpaper.service";
    };
  };

  systemd.services."copy-current-wallpaper" = {
    description = "Copy current wallpaper to /etc";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/cp /home/${user}/.config/current-wallpaper /etc/current-wallpaper";
    };
    requires = [ "watch-current-wallpaper.path" ];
    after = [ "watch-current-wallpaper.path" ];
  };
}