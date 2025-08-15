{ inputs, user, ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.${user}.openssh.authorizedKeys.keyFiles = [ inputs.ssh-keys.outPath ];

  programs.ssh = {
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
