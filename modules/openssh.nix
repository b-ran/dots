{ user, public-key, ... }:

{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "${public-key}"
  ];

  security.pam.enableSSHAgentAuth = true;
  programs.ssh.startAgent = true;
}