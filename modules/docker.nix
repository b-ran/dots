{ pkgs, user, ... }:

{
  users.users.${user}.extraGroups = [ "docker" ];
  virtualisation.docker = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
