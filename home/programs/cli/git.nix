{
  programs = {
    git = {
      enable = true;
      aliases = {
        gp = "push";
        gpl = "pull";
        gc = "commit -m";
        gco = "checkout";
      };
      delta = {
        enable = true;
      };
    };
  };
}