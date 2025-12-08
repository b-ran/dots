{
  programs = {
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        features = "decorations";
        side-by-side = true;
        line-numbers = true;
      };
    };
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        user.signingkey = "~/.ssh/id_ed25519";
        gpg.format = "ssh";
        commit.gpgsign = true;
      };
    };
  };
}
