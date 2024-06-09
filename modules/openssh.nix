{ inputs, user, ... }:

{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.${user}.openssh.authorizedKeys.keyFiles = [ inputs.ssh-keys.outPath ];

  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };
}