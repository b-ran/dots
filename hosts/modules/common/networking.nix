{ pkgs, ... }:

{
  networking = {
    enableIPv6 = false;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 2000;
          to = 3100;
        }
        {
          from = 8000;
          to = 8100;
        }
        {
          from = 5000;
          to = 5200;
        }
      ];
    };
  };
}
