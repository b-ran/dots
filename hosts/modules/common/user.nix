{
  pkgs,
  user,
  ...
}:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };
}
