{ pkgs, user, ... }:

{
  virtualisation.docker = {
    enable = true;
  };
  users.users.${user}.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  environment.shellAliases = {
    dstop = "docker stop $(docker ps -a -q) 2>/dev/null";
    dnuke = ''
      docker stop $(docker ps -aq) 2>/dev/null || true && \
      docker container prune -f 2>/dev/null || true && \
      docker image prune -af 2>/dev/null || true && \
      docker volume prune -f 2>/dev/null || true && \
      docker network prune -f 2>/dev/null || true && \
      docker system prune -af --volumes && \
      sudo rm -rf /var/lib/docker && \
      sudo systemctl restart docker
    '';
  };
}
