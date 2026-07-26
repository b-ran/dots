{
  services.gnome-keyring = {
    enable = true;
    # "ssh" omitted: home/cli/zsh.nix already runs its own ssh-agent plugin,
    # and both would fight over SSH_AUTH_SOCK.
    components = [
      "pkcs11"
      "secrets"
    ];
  };
}
