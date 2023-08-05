{ user, public-key, ... }:

{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "${public-key}"
  ];

  programs.ssh.startAgent = true;
}